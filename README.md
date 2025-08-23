vVyana-store · Django 4.2

پروژهٔ بک‌اند فروشگاهی با Django برای نمایش مهارت‌ها: URLهای تمیز و امن، OTP پیامکی با کاوه‌نگار، پرداخت زرین‌پال (کد آماده)، ذخیره‌سازی S3-Compatible (ArvanCloud)، و پردازش پس‌زمینه با Celery + RabbitMQ + Celery Beat.

 ویژگی‌ها
- **URLهای تمیز و امن**: namespace + reverse + UUID + تنظیمات امن تولید
- **OTP (Kavenegar)**: ثبت‌نام/ورود با کد یک‌بارمصرف + expire + rate limit
_پرداخت (Zarinpal): درخواست/بازگشت/تأیید با feature flag (sandbox-ready)
- ذخیره‌سازی (S3/ArvanCloud): آپلود مدیا با `django-storages[boto3]`
- پس‌زمینه: Celery worker + RabbitMQ broker + Celery Beat برای زمان‌بندی


## 🚀 شروع سریع (Local)
```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python manage.py migrate
python manage.py runserver






DEBUG=True
SECRET_KEY=change-me
ALLOWED_HOSTS=127.0.0.1,localhost
DATABASE_URL=postgres://user:pass@localhost:5432/{{db_name}}

# OTP (Kavenegar)
KAVENEGAR_API_KEY=
KAVENEGAR_OTP_TEMPLATE=otp
OTP_EXP_MINUTES=2
OTP_RATE_LIMIT_PER_IP=5

# Zarinpal
ZARINPAL_ENABLED=False
ZARINPAL_MERCHANT_ID=
ZARINPAL_CALLBACK_URL=https://your-domain.com/payment/verify/

# Celery / RabbitMQ
CELERY_BROKER_URL=amqp://guest:guest@localhost:5672//
CELERY_RESULT_BACKEND=rpc://
CELERY_TIMEZONE=Asia/Tehran

# S3-Compatible (ArvanCloud)
USE_S3=True
AWS_ACCESS_KEY_ID=![Screenshot 2025-08-23 at 19 42 04](https://github.com/user-attachments/assets/c8750296-4567-4c96-a5f9-eaaad7acce73)

AWS_SECRET_ACCESS_KEY=
AWS_STORAGE_BUCKET_NAME={{bucket}}
AWS_S3_REGION_NAME=ir-any
AWS_S3_ENDPOINT_URL=https://s3.ir-thr-at1.arvanstorage.com
AWS_S3_CUSTOM_DOMAIN=
