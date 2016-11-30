import 'dart:html';
import 'package:angular2/core.dart';
import 'package:tal_components/resize_sensor/resize_sensor.dart';

@Component(
    selector: 'my-app',
    directives: const[ResizeSensor],
    template: '''
      <div #sizeCheckedElement>
        <textarea>{{height}}</textarea>
        <resize-sensor [resizeEvent]="resizeEvent"></resize-sensor>
      </div>
     '''
)
class AppComponent implements OnInit{
  HtmlElement _sizeCheckedElement;
  ResizeEvent resizeEvent = new ResizeEvent();
  int height = 0;
  @ViewChild('sizeCheckedElement')
  set sizeCheckedElement(ElementRef elementRef) {
    _sizeCheckedElement = elementRef.nativeElement;
  }
  @override
  void ngOnInit() {
    resizeEvent.sizeCheckedElement = _sizeCheckedElement;
    resizeEvent.onHeightChanged = (){
      height = resizeEvent.height;
    };
    resizeEvent.onWidthChanged = (){
      // _sizeCheckedElement cannot have display:block to change width on resize of textarea
      // you can use display:inline-block instead to catch this event
      print(resizeEvent.width);
    };
  }
}
