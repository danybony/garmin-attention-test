import Toybox.ActivityRecording;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Timer;
import Toybox.WatchUi;

using Toybox.Attention;
using Toybox.FitContributor;

class AttentionView extends WatchUi.View {

    private const MAX_SOUND_ID = 18;

    private var _selectedSound = 0;

    //! Constructor
    public function initialize() {
        WatchUi.View.initialize();
    }

    //! Load your resources here
    //! @param dc Device context
    public function onLayout(dc as Dc) as Void {
        // no-op
    }

    //! Update the view
    //! @param dc Device Context
    public function onUpdate(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        if (Attention has :playTone) {
            dc.drawText(dc.getWidth() / 2, dc.getHeight() / 2 - Graphics.getFontHeight(Graphics.FONT_NUMBER_HOT) / 2, Graphics.FONT_NUMBER_HOT, ""+_selectedSound, Graphics.TEXT_JUSTIFY_CENTER);
        } else {
            dc.drawText(dc.getWidth() / 2, dc.getHeight() / 2 - Graphics.getFontHeight(Graphics.FONT_SMALL) / 2, Graphics.FONT_SMALL, "No sound support", Graphics.TEXT_JUSTIFY_CENTER);
        }
    }

    public function selectNextSound() {
        _selectedSound++;
        if (_selectedSound > MAX_SOUND_ID) {
            _selectedSound = 0;
        }
        WatchUi.requestUpdate();
    }

    public function selectPreviousSound() {
        _selectedSound--;
        if (_selectedSound == 0) {
            _selectedSound = MAX_SOUND_ID;
        }
        WatchUi.requestUpdate();
    }

    public function playCurrent() {
        if (Attention has :playTone) {
            Attention.playTone(_selectedSound);
        }
    }
}
