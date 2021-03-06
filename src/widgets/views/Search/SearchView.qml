import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "../../../view_models"
import "../../../db/Query.js" as Q
import org.kde.mauikit 1.0 as Maui


Maui.Page
{
    property string currentQuery : ""

    margins: 0
    headBar.visible: false

    PixGrid
    {
        id: searchResults

        anchors.fill: parent
        headBar.visible: true
        headBarExitIcon: "edit-clear"
        headBarTitle: searchResults.grid.count + qsTr(" results")
        holder.emoji: "qrc:/img/assets/BugSearch.png"
        holder.isMask: false
        holder.title : "No Results!"
        holder.body: "Try with another query"
        holder.emojiSize: iconSizes.huge

    }

    footBar.drawBorder: false
    footBar.middleContent: Maui.TextField
    {
        id: searchInput
        placeholderText: qsTr("Search...")
        width: footBar.middleLayout.width * 0.9

        onAccepted: runSearch(searchInput.text)
    }

    function refreshPics()
    {
        searchResults.list.refresh()
    }

    function runSearch(query)
    {
        if(query)
        {
            currentQuery = query
            searchResults.list.query = Q.Query.searchFor_.arg(currentQuery)

//            var queries = query.split(",")
//            for(var i in queries)
//            {
//                var res =[]
//                res.push(pix.get(Q.Query.searchFor_.arg(queries[i])))
//                res.push(tag.getUrls(query, true))
//                populate(res)
//            }
        }
    }

//    function populate(data)
//    {
//        if(data.length > 0)
//            for(var i in data)
//                searchResults.model.append(data[i])
//    }
}
