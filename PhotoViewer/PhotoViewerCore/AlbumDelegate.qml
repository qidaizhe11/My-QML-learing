
import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQml.Models 2.1

Component {
    id: album_delegate
    Package {
        Item {
            Package.name: 'browser'
            GridView {
                id: photos_grid_view
                model: virs
            }
        }

        Item {
            Package.name: 'album'
            id: album_wrapper; width: 210; height: 220
        }
    }
}
