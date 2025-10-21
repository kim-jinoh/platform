# Docker 개발 가이드

간단히 개발 환경에서 Docker를 사용해 애플리케이션을 실행하는 방법을 정리합니다.

기본 원칙
- 현재 저장소는 **개발 전용** Docker 구성입니다.
- 호스트 포트 `8080`이 컨테이너 내부 포트 `8080`으로 매핑되어 있습니다.
- 소스는 컨테이너에 마운트되어 변경 시 즉시 반영됩니다.

파일
- `Dockerfile`: 개발용 JDK 이미지 기반, `./gradlew bootRun`을 기본 명령으로 실행합니다.
- `docker-compose.yml`: 개발용 compose. 소스 마운트, 포트 매핑, 환경 변수 설정 포함.

사전 준비
1. 로컬에 Docker와 `docker compose`(Compose V2)가 설치되어 있어야 합니다.
2. `gradlew`에 실행 권한이 없으면 권한 부여:

```bash
chmod +x gradlew
```

개발 실행
- 컨테이너 빌드 및 실행 (개발용)

```bash
# 빌드 및 실행
docker compose up --build

# 또는 백그라운드 실행
docker compose up --build -d

# 로그 확인
docker compose logs -f

# 중지 및 제거
docker compose down
```

컨테이너 내부 포트 접근
- 브라우저에서 http://localhost:8080 으로 접속하면 애플리케이션에 연결됩니다.

주의사항
- `docker-compose.yml`은 개발용으로 설계되어 있습니다. 프로덕션 배포용으로 사용하지 마세요.
- 코드 변경이 컨테이너에 즉시 반영되도록 소스 전체를 볼륨으로 마운트합니다. 이로 인해 컨테이너 내에 빌드된 JAR 파일이 덮어질 수 있습니다(의도된 동작).
- 필요 시 `Dockerfile` 또는 `docker-compose.yml`을 분리하여 프로덕션 이미지를 별도로 구성하세요.

문제가 발생하면 `docker compose logs`와 `docker compose ps`로 상태와 로그를 확인하세요.
