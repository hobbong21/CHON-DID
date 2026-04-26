# CHON-DID 모노레포 Push 가이드

이 폴더(`C:\I. Program\Workspace_\DID`)를 `https://github.com/hobbong21/CHON-DID.git`에 모노레포로 push하기 위한 절차입니다.

## 사전 작업 (Claude가 이미 한 것)

- `CHON_DID_BE-main` → `backend/`, `CHON_DID_FE-main` → `mobile/`로 폴더 정리
- 루트에 `README.md` (모노레포 설명) 생성
- 루트에 `.gitignore` 생성 (Java + Flutter + 시크릿 안전망 포함)
- 민감 파일 스캔 — `.env`, `*.jks`, `key.properties`, 하드코딩된 password/token 없음 확인 (`JWT_SECRET=change-me-in-production-...`은 명백한 placeholder)

## ⚠️ Push 전에 손으로 정리해야 할 항목

샌드박스 권한 제약으로 Claude가 직접 지우지 못한 두 폴더가 있습니다. **PowerShell을 관리자 권한으로 실행**해서 지워주세요.

```powershell
cd "C:\I. Program\Workspace_\DID"

# 1) 샌드박스에서 git init이 실패하면서 남긴 손상된 .git 폴더
Remove-Item -Recurse -Force ".git_BROKEN_DELETE_ME"

# 2) backend 안에 통째로 복사돼 있는 mobile 코드 중복본 (mobile/와 byte-identical, 26MB)
Remove-Item -Recurse -Force "backend\chon-mobile-main"
```

> 둘 다 `.gitignore`에도 등록해놨기 때문에 혹시 못 지우더라도 push 대상에는 안 들어갑니다. 다만 로컬에 남아있으면 거슬리니 정리 권장.

## Push 절차

### 0. 폴더 이동 + git 사용자 정보 확인

```powershell
cd "C:\I. Program\Workspace_\DID"

# 본인 GitHub 계정으로 commit이 찍히도록 (이미 설정돼 있으면 생략 가능)
git config --global user.name  "hobbong21"
git config --global user.email "hobbong21@gmail.com"
```

### 1. main 브랜치로 초기화 + 첫 커밋

```powershell
git init -b main
git add .
git status              # ← .env, *.jks, application-local.properties 등이 안 들어가는지 한 번 더 확인
git commit -m "chore: initial monorepo import (backend + mobile)"
```

### 2. 원격 저장소 연결

```powershell
git remote add origin https://github.com/hobbong21/CHON-DID.git
git remote -v
```

### 3. main 푸시

```powershell
git push -u origin main
```

> **인증 프롬프트가 뜨면**
> - Username: `hobbong21`
> - Password: GitHub Personal Access Token (PAT) — 일반 비밀번호는 안 받습니다.
>   PAT 발급: https://github.com/settings/tokens → "Generate new token (classic)" → `repo` 권한 체크.
> - 한번 입력하면 Git Credential Manager가 캐시해서 다음번부터 안 물어봅니다.

### 4. dev 브랜치 생성 + 푸시

```powershell
git checkout -b dev
git push -u origin dev
git checkout main       # 작업은 dev에서 하고, main은 깨끗하게
```

이걸로 `main`, `dev` 두 브랜치 모두 origin에 올라간 상태가 됩니다.

## 푸시 이후 GitHub 측 권장 설정

저장소 페이지 → Settings:

- **Default branch**: `dev` (일일 개발이 dev에서 일어나니까)
- **Branch protection rules** (`main`):
  - "Require a pull request before merging" 체크
  - "Require approvals" 1명 이상
  - "Do not allow bypassing the above settings"
- **Secrets and variables → Actions**: README.md 표에 나와 있는 시크릿들 등록 (`KEYSTORE_BASE64`, `FIREBASE_TOKEN`, AWS OIDC role 등)
- **Actions**: `.github/workflows/backend-ci.yml`, `mobile-ci.yml`이 자동 인식됩니다. 첫 푸시 후 Actions 탭에서 워크플로 활성화 확인.

## 문제 해결

| 증상 | 원인 / 해결 |
|---|---|
| `fatal: remote origin already exists` | `git remote remove origin` 후 다시 `git remote add` |
| `Updates were rejected ... non-fast-forward` | GitHub에 이미 README가 있는 상태. `git pull origin main --allow-unrelated-histories`로 머지 후 다시 push |
| 인증 실패 (`Authentication failed`) | PAT 만료/권한 부족. 새 토큰 발급해서 재시도. Windows 자격 증명 관리자에서 git 항목 삭제 후 다시 입력. |
| push가 너무 느리거나 멈춤 | `backend/chon-mobile-main/`을 안 지운 상태일 수 있음. `.gitignore`에 들어 있어 commit엔 안 들어가지만, `git status` 한번 더 확인. |
| `.git_BROKEN_DELETE_ME` 못 지움 | PowerShell을 관리자 권한으로 다시 열어서 시도, 또는 `cmd /c "rmdir /s /q .git_BROKEN_DELETE_ME"`. |

## 한 줄 요약

```powershell
# 위 단계를 한 번에:
cd "C:\I. Program\Workspace_\DID"
Remove-Item -Recurse -Force ".git_BROKEN_DELETE_ME","backend\chon-mobile-main"
git init -b main
git add . ; git commit -m "chore: initial monorepo import (backend + mobile)"
git remote add origin https://github.com/hobbong21/CHON-DID.git
git push -u origin main
git checkout -b dev ; git push -u origin dev
git checkout main
```
