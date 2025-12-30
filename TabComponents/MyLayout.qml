import QtQuick
import QtQuick.Layouts
StackLayout {
    id: myStackLayout

    signal removedTab(index: int)

    function setView(inst: string):bool
    {
        return true
    }

    function removeView(index:int): bool
    {
        if(index<0 || index>=myStackLayout.children.length)
            return false
        myStackLayout.children[index].destroy()
        myStackLayout.removedTab(index)
        return true
    }
}
