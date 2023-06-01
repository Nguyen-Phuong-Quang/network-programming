#ifndef USER_H
#define USER_H

#include <QObject>

class User : public QObject
{
    Q_OBJECT
public:
    explicit User(QObject *parent = nullptr);

signals:

public slots:
    QStringList get_users();

private:
    QStringList users_;
};

#endif // USER_H
