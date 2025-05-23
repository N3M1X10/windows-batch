# 📕readme-ru.md [`eng`](https://github.com/N3M1X10/windows-batch/tree/master/src/system-policies/uac/readme.md) | `rus`

Данный раздел включает в себя пакеты отключения/восстановления системной функции Windows: **User Account Control**

>[!caution]
>Функция для опытных пользователей! Пользоваться на свой страх и риск!

- Отключение UAC - упрощает ваш запуск программ, пакетных файлов скриптов, итд., всего - что требует права администратора для корректной работы.
- Это отключит уведомления о том - что какое-то приложение требует прав администратора
- Это может увеличить риски безопасности, если вы неосторожны в сети, и качаете файлы из недостоверных источников

## Файлы
- [`src/net/uac/disable-UAC.bat`](https://github.com/N3M1X10/windows-batch/tree/master/src/system-policies/uac/disable-UAC.bat) - Запустите чтобы отключить UAC
- [`src/net/uac/restore-UAC.bat`](https://github.com/N3M1X10/windows-batch/tree/master/src/system-policies/uac/restore-UAC.bat) - Запустите чтобы восстановить UAC

>[!important]
>После данных операций, для вступления изменений в силу - требуется перезапустить систему!
