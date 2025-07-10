# Менеджер SSH подключений для powershell
### Как пользоваться?
- Закиньте папку login в модули PowerShell ($env:PSModulePath).
- Создайте в корне папки **login** файл **.env** в формате csv с полями **name, ip, port**. Заполните таблицу (пример будет ниже).
- Добавьте импорт модуля в $PROFILE (Import-Module login).
- Открываем запускаем PowerShell и пишем **login**, либо **login \*имя подключения\***

Пример заполнения файла .env
```
name,ip,port
home,root@192.168.1.1,22
server1,root@10.10.10.12,69
server2,admin@10.10.20.130,2222
```