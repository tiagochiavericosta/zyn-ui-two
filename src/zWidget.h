#pragma once
#include <QtQuick/QQuickItem>
#include "../draw.h"

struct NVGcontext;

class zWidget:public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(qreal zscale  MEMBER m_zscale);
    Q_PROPERTY(qreal aspect  MEMBER m_zaspect);
    Q_PROPERTY(bool  expandable MEMBER m_zexpandable);
    Q_PROPERTY(QString label MEMBER m_label);
public:
    zWidget(QQuickItem *parent=0);
    virtual ~zWidget(){};
    std::string getLabel() const;

public slots:
    virtual void abstractPaint();
    virtual void paint(NVGcontext *vg)=0;
    void handleWindowChanged(QQuickWindow *win);
    void handleSync();
protected:
    qreal m_zscale, m_zaspect;
    QString m_label;
    bool m_zexpandable;
};
