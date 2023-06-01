#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>

typedef struct {
    int is_you;
    QString message;
} message_data;

class Message : public QObject
{
    Q_OBJECT
public:
    explicit Message(QObject *parent = nullptr);

signals:

public:

private:
    QList <message_data> messages_;
};

#endif // MESSAGE_H
