#include "message.h"

Message::Message(QObject *parent) : QObject(parent)
{
    message_data msg1;
    msg1.is_you = 0;
    msg1.message = "Hi quang";
    messages_.append(msg1);
    message_data msg2;
    msg2.is_you = 0;
    msg2.message = "Hi Giang";
    messages_.append(msg2);
}
