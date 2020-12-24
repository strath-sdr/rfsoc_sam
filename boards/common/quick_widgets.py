import ipywidgets as ipw

class FloatText():
    """Helper class for float text widgets."""
    def __init__(self,
                 value,
                 min_value,
                 max_value,
                 step,
                 description,
                 callback
                 ):
        
        def on_value_change(change):
            callback(change['new'])
        
        self._text_box = ipw.BoundedFloatText(
            value=value,
            min=min_value,
            max=max_value,
            step=step,
            description=description,
            continuous_update=False,
            style={'description_width': 'initial'},
            disabled=False
        )
        
        self._text_box.observe(on_value_change, names='value')
        
    def get_widget(self):
        return self._text_box
    
class Button():
    """Helper class for button widgets."""
    def __init__(self,
                 callback,
                 description_on = ' ',
                 description_off = ' ',
                 state = True,
                 button_id = 0):
        self._state = state
        self._button_id = button_id
        self._callback = callback
        self._description_on = description_on
        self._description_off = description_off
        self._button = ipw.Button(description=self._description_on if self._state else self._description_off,
                                  layout=ipw.Layout(margin='auto',
                                                    border='none'))
        self._button.on_click(lambda _: self.on_click())
        
        if self._state:
            self._button.style.button_color = 'royalblue'
        else:
            self._button.style.button_color = 'tomato'
        
    def on_click(self):
        self._state = not self._state
        self._callback(value = self._state, button_id = self._button_id)
        if self._state:
            self._button.style.button_color = 'royalblue'
            self._button.description = self._description_on
        else:
            self._button.style.button_color = 'tomato'
            self._button.description = self._description_off
            
    def get_widget(self):
        return self._button
    
class Accordion():
    """Helper class for accordion widgets."""
    def __init__(self,
                 title, 
                 widgets):
        self._title = title
        self._widgets = widgets
        self._vbox = ipw.VBox([])
        
        for i in range(len(self._widgets)):
            self._vbox.children+=(self._widgets[i],)
        self._accordion = ipw.Accordion(children=[self._vbox],layout=ipw.Layout(width='auto'))
        self._accordion.set_title(0, self._title)

    def get_widget(self):
        return self._accordion