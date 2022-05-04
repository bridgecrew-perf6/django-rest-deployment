import os
import django
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "api_crud.settings")
django.setup()

from django.contrib.auth.models import User

# TODO: Change username and password
u = User(username='admin')
u.set_password('admin123')
u.is_superuser = True
u.is_staff = True
u.save()