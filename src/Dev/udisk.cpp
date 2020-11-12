#include "udisk.h"
#include <sys/socket.h>
#include <linux/netlink.h>
#include <errno.h>//内存信息
#include <unistd.h>
#include <stdio.h>
#include <QDebug>

QString g_SUName;
#define UEVENT_BUFFER_SIZE 2048

static int init_hotplug_sock(void)
{
    struct sockaddr_nl snl;
    const int buffersize = 16 * 1024 * 1024;
    int retval;

    memset(&snl, 0x00, sizeof(struct sockaddr_nl));
    snl.nl_family = AF_NETLINK;
    snl.nl_pid = getpid();
    snl.nl_groups = 1;
    int hotplug_sock =
            socket(PF_NETLINK, SOCK_DGRAM, NETLINK_KOBJECT_UEVENT);

    if (hotplug_sock == -1) {
        printf("error getting socket: %s", strerror(errno));
        return -1;
    }

    /* set receive buffersize */
    setsockopt(hotplug_sock,SOL_SOCKET, SO_RCVBUFFORCE,
               &buffersize, sizeof(buffersize));

    retval = bind(hotplug_sock,(struct sockaddr *) &snl,sizeof(struct sockaddr_nl));

    if (retval < 0)
    {
        printf("bind failed: %s", strerror(errno));
        ::close(hotplug_sock);
        hotplug_sock = -1;
        return -1;
    }

    return hotplug_sock;
}

uDisk::uDisk(QObject *parent) : QThread(parent)
{

}

uDisk::~uDisk()
{

}

uDisk* uDisk::getInst()
{
    static uDisk* inst = 0;
    if (0 == inst)
    {
        inst = new uDisk();
        if (inst)
        {
            inst->start();
        }
    }

    return inst;
}

void uDisk::run()
{
    int hotplug_sock = init_hotplug_sock();
    while(1)
    {
        char buf[UEVENT_BUFFER_SIZE*2] = {0};
        recv(hotplug_sock, &buf, sizeof(buf), 0);
        //********************************************************************//
        QString str = QString(buf);
        if(str.contains("sd"))
        {
            int index = str.indexOf("sd");
            int len = str.length();
            QString str2 = str.mid(index,len);
            int first = str2.lastIndexOf ("/"); //从后面查找"/"位置
            QString path = str2.right (str2.length ()-first-1); //从右边截取
            if(path.length() == 4)
            {
                g_SUName = path;
                qDebug()<<"g_SUNameg_SUNameg_SUNameg_SUNameg_SUName:"<<g_SUName;
            }

            if(str.contains("remove"))
            {
                system("sudo umount /mnt");
                emit udiskRemove();
                qDebug()<<"热插拔设备已移除。";
            }
            else if(str.contains("add"))
            {
                QString mou = QString("sudo mount /dev/%1 usb").arg(g_SUName);
                system(mou.toLatin1().data());
                emit udiskAdd();
                qDebug()<<"热插拔设备已挂载。";
            }
        }
        //********************************************************************//
    }
}
