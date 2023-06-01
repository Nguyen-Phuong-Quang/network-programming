#include "user.h"

User::User(QObject *parent) : QObject(parent)
{
    users_ << "Quang" << "Giang";
}

QStringList User::get_users() {
    return users_;
}
