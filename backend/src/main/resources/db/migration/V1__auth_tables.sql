-- Auth system tables for CHON
-- Apply manually: mysql -u <user> -p <db> < V1__auth_tables.sql

-- Add auth columns to users table
ALTER TABLE users
  ADD COLUMN IF NOT EXISTS email VARCHAR(255) NULL,
  ADD COLUMN IF NOT EXISTS failed_login_attempts INT DEFAULT 0,
  ADD COLUMN IF NOT EXISTS locked_until DATETIME NULL,
  ADD COLUMN IF NOT EXISTS two_fa_secret VARCHAR(255) NULL,
  ADD COLUMN IF NOT EXISTS two_fa_enabled TINYINT(1) DEFAULT 0;

-- Indexes (ignore if already exist)
CREATE UNIQUE INDEX idx_users_email ON users(email);
-- phone_number may already have a unique index from vendor schema
-- CREATE UNIQUE INDEX idx_users_phone ON users(phone_number);

-- Refresh token rotation + device binding
CREATE TABLE IF NOT EXISTS refresh_tokens (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT NOT NULL,
  token_jti VARCHAR(36) NOT NULL,
  access_jti VARCHAR(36) NOT NULL,
  family_id VARCHAR(36) NOT NULL,
  device_id VARCHAR(64) NULL,
  expires_at DATETIME NOT NULL,
  absolute_expires_at DATETIME NOT NULL,
  revoked TINYINT(1) DEFAULT 0,
  revoked_at DATETIME NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_rt_jti (token_jti),
  INDEX idx_rt_family (family_id),
  INDEX idx_rt_user (user_id),
  INDEX idx_rt_expires (expires_at),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- OTP codes with hashed storage
CREATE TABLE IF NOT EXISTS otp_codes (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  phone_number VARCHAR(20) NOT NULL,
  code_hash VARCHAR(64) NOT NULL,
  purpose ENUM('REGISTER','PASSWORD_RESET','TWO_FA','PHONE_VERIFY') NOT NULL,
  expires_at DATETIME NOT NULL,
  attempts INT DEFAULT 0,
  used TINYINT(1) DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_otp_phone (phone_number, purpose, used)
);

-- Auth event audit trail
CREATE TABLE IF NOT EXISTS auth_events (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT NULL,
  event_type VARCHAR(30) NOT NULL,
  ip_address VARCHAR(45) NULL,
  device_id VARCHAR(64) NULL,
  details VARCHAR(255) NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_ae_user (user_id),
  INDEX idx_ae_type (event_type)
);
