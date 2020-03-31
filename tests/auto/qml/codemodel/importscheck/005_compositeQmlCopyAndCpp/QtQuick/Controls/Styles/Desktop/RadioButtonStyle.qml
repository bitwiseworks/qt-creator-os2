/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Quick Controls module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Private 1.0

Style {
    readonly property RadioButton control: __control
    property Component panel: Item {
        anchors.fill: parent

        implicitWidth:  styleitem.implicitWidth
        implicitHeight: styleitem.implicitHeight
        baselineOffset: styleitem.baselineOffset

        StyleItem {
            id: styleitem
            elementType: "radiobutton"
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: macStyle ? -1 : 0
            sunken: control.pressed
            on: control.checked || control.pressed
            hover: control.hovered
            enabled: control.enabled
            hasFocus: control.activeFocus && styleitem.style == "mac"
            hints: control.styleHints
            contentHeight: textitem.implicitHeight
            contentWidth: textitem.implicitWidth + indicatorWidth
            property int indicatorWidth: pixelMetric("indicatorwidth") + (macStyle ? 2 : 4)
            property bool macStyle: (style === "mac")

            Text {
                id: textitem
                text: control.text
                anchors.left: parent.left
                anchors.leftMargin: parent.indicatorWidth
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: parent.macStyle ? 2 : 0
                anchors.right: parent.right
                renderType: Text.NativeRendering
                elide: Text.ElideRight
                enabled: control.enabled
                color: __syspal.windowText
                StyleItem {
                    elementType: "focusrect"
                    anchors.margins: -1
                    anchors.leftMargin: -2
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    width: textitem.implicitWidth + 3
                    visible: control.activeFocus
                }
            }
        }
    }
}