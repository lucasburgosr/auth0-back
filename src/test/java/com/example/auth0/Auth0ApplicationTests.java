package com.example.auth0;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.beans.factory.annotation.Value;
import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
class Auth0ApplicationTests {

	@Value("${spring.security.oauth2.resourceserver.jwt.issuer-uri}")
	private String issuerUri;

	@Value("${auth0.audience}")
	private String audience;

	@Value("${web.cors.allowed-origins}")
	private String allowedOrigins;

	@Test
	void contextLoads() {
		assertThat(issuerUri).isNotNull();
		assertThat(audience).isNotNull();
		assertThat(allowedOrigins).isNotNull();
	}
}

