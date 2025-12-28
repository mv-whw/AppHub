import QtQuick
import QtQuick.Layouts
StackLayout {
    id: myStackLayout

    function setView(inst: string):bool
    {
        return true
    }

    function removeView(index:int): bool
    {
        if(index<0 || index>=myStackLayout.children.length)
            return false
        myStackLayout.children[index].destroy()
        return true
    }
}
