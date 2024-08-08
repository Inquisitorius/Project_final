package com.zerock.test.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {

    private final UserDetailsService userDetailsService;

    public WebSecurityConfig(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf
                .ignoringRequestMatchers(
                    new AntPathRequestMatcher("/login", "POST"),
                    new AntPathRequestMatcher("/join", "POST"),
                    new AntPathRequestMatcher("/logout", "POST")
                )
            )
            .authorizeHttpRequests(auth -> auth 
            	
                
                .requestMatchers(new AntPathRequestMatcher("/admin")).hasRole("ADMIN") // ADMIN 권한만 접근 허용
                .anyRequest().permitAll() // 나머지 요청은 접근 허용
                
            )
            .exceptionHandling(exceptionHandling -> exceptionHandling
            		.accessDeniedPage("/adminfail")           		
            )
            .formLogin(formLogin -> formLogin
                .loginPage("/login") // 로그인 페이지 설정
                .defaultSuccessUrl("/hello", true) // 로그인 성공 시 리다이렉트
                .failureUrl("/login?error=true") // 로그인 실패 시 리다이렉트
                .permitAll()
            )
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/hello")
                .invalidateHttpSession(true)
                .permitAll()
            )
            .anonymous(an -> an.disable())
            .userDetailsService(userDetailsService);

        return http.build();
    }
}
