import Toybox.Lang;
import Toybox.WatchUi;

//! Input handler to stop timer on menu press
class AttentionDelegate extends WatchUi.BehaviorDelegate {
    private var _view as AttentionView;

    //! Constructor
    //! @param view The app view
    public function initialize(view as AttentionView) {
        WatchUi.BehaviorDelegate.initialize();
        _view = view;
    }

    //! Play the current selected sound
    //! @return true if handled, false otherwise
    public function onSelect() as Boolean {
        _view.playCurrent();
        return true;
    }

    //! Select previous sound
    public function onPreviousPage() as Boolean {
        _view.selectPreviousSound();
        return true;
    }

    //! Select next sound
    public function onNextPage() as Boolean {
        _view.selectNextSound();
        return true;
    }
}
