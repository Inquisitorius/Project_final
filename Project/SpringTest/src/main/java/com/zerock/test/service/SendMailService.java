package com.zerock.test.service;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zerock.test.dto.UserDTO;
import com.zerock.test.mapper.UserMapper;

import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class SendMailService {

    private final UserMapper mapper;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    private final JavaMailSender javaMailSender;

   
     public SendMailService(UserMapper mapper, BCryptPasswordEncoder bCryptPasswordEncoder,
            JavaMailSender javaMailSender) {
         this.mapper = mapper;
         this.bCryptPasswordEncoder = bCryptPasswordEncoder;
         this.javaMailSender = javaMailSender;
     }

    @Transactional
    public void UpdatePassword(UserDTO dto) {
        String tempPwd = getTempPassword();
        String encodedTempPwd = passwordEncoder(tempPwd);
        mapper.updateUserPassWord(dto.getMail(), encodedTempPwd);
        sendPasswordResetMail(dto.getMail(), tempPwd);
    }

    // 임시 비밀번호 생성
    public String getTempPassword() {
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

        StringBuilder tempPwd = new StringBuilder();
        int idx;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            tempPwd.append(charSet[idx]);
        }
        return tempPwd.toString();
    }

    public String passwordEncoder(String tempPwd) {
        return bCryptPasswordEncoder.encode(tempPwd);
    }

    // 메서드 선언부 수정
    private void sendPasswordResetMail(String email, String pwd) {
        String subject = "임시 비밀번호 안내";
        String message = "안녕하세요,\n\n임시 비밀번호는 " + pwd + " 입니다. 로그인 후 비밀번호를 변경해주시기 바랍니다.";
        String sender = "qkrgusdhr98@naver.com";
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
            helper.setFrom(sender);
            helper.setTo(email);
            helper.setSubject(subject);
            helper.setText(message);
            javaMailSender.send(mimeMessage);
        } catch (Exception e) {
            throw new RuntimeException("메일 전송 실패", e);
        }
    }
}
