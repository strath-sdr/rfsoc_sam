__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_sam"

import ipywidgets as ipw


class Label():
    """Helper class for label widgets.
    """
    def __init__(self,
                 value,
                 svalue='',
                 evalue='',
                 dict_id=''):
    
        self._svalue = svalue
        self._evalue = evalue
        self._label = ipw.Label(value=''.join([self._svalue,value,self._evalue]))
        self._dict_id = dict_id
    
    @property
    def value(self):
        return self._label.value
    
    @value.setter
    def value(self, value):
        self._label.value = ''.join([self._svalue,value,self._evalue])
        
    def get_widget(self):
        return self._label
        
        
class DropDown():
    """Helper class for dropdown widgets.
    """
    def __init__(self,
                 callback,
                 options,
                 value,
                 description,
                 dict_id = '',
                 description_width='150px',
                 layout_width='300px'):
    
        def on_value_change(change):
            callback({self._dict_id : change['new']})
            
        self._dict_id = dict_id
        self._dropdown = ipw.Dropdown(options=options,
                                      value=value,
                                      description=description,
                                      style={'description_width': description_width},
                                      layout = {'width': layout_width},)
        self._dropdown.observe(on_value_change, names='value')
        
    @property
    def value(self):
        return self._dropdown.value
    
    @value.setter
    def value(self, value):
        self._dropdown.value = value
        
    def get_widget(self):
        return self._dropdown
    
    
class CheckBox():
    """Helper class for CheckBox widgets.
    """
    def __init__(self,
                 callback,
                 value,
                 description,
                 indent=True,
                 dict_id = '',
                 description_width='150px',
                 layout_width='300px'):
    
        def on_value_change(change):
            callback({self._dict_id : change['new']})
            
        self._dict_id = dict_id
        self._checkbox = ipw.Checkbox(value=value,
                                      description=description,
                                      indent=indent,
                                      style={'description_width': description_width},
                                      layout = {'width': layout_width},)
        self._checkbox.observe(on_value_change, names='value')
        
    @property
    def value(self):
        return self._checkbox.value
    
    @value.setter
    def value(self, value):
        self._checkbox.value = value
        
    def get_widget(self):
        return self._checkbox
    

class FloatText():
    """Helper class for float text widgets.
    """
    def __init__(self,
                 callback,
                 value,
                 min_value,
                 max_value,
                 step,
                 description,
                 dict_id = '',
                 description_width='150px',
                 layout_width='300px'):
        
        def on_value_change(change):
            callback({self._dict_id : change['new']})

        self._dict_id = dict_id
        
        self._text_box = ipw.BoundedFloatText(
            value=value,
            min=min_value,
            max=max_value,
            step=step,
            description=description,
            continuous_update=False,
            style={'description_width': description_width},
            layout = {'width': layout_width},
            disabled=False
        )
        
        self._text_box.observe(on_value_change, names='value')
        
    @property
    def value(self):
        return self._text_box.value
    
    @value.setter
    def value(self, value):
        self._text_box.value = value
        
    @property
    def step(self):
        return self._text_box.step
    
    @step.setter
    def step(self, step):
        self._text_box.step = step
        
    def get_widget(self):
        return self._text_box
    
    
class IntText():
    """Helper class for integer text widgets.
    """
    def __init__(self,
                 callback,
                 value,
                 min_value,
                 max_value,
                 step,
                 description,
                 dict_id = '',
                 description_width='150px',
                 layout_width='300px'):
        
        def on_value_change(change):
            callback({self._dict_id : change['new']})

        self._dict_id = dict_id
        
        self._text_box = ipw.BoundedIntText(
            value=value,
            min=min_value,
            max=max_value,
            step=step,
            description=description,
            continuous_update=False,
            style={'description_width': description_width},
            layout = {'width': layout_width},
            disabled=False
        )
        
        self._text_box.observe(on_value_change, names='value')
        
    @property
    def value(self):
        return self._text_box.value
    
    @value.setter
    def value(self, value):
        self._text_box.value = value
        
    @property
    def step(self):
        return self._text_box.step
    
    @step.setter
    def step(self, step):
        self._text_box.step = step
        
    def get_widget(self):
        return self._text_box
    
    
class Button():
    """Helper class for button widgets.
    """
    def __init__(self,
                 callback,
                 description_on = ' ',
                 description_off = ' ',
                 state = True,
                 dict_id = ''):
        self._state = state
        self._dict_id = dict_id
        self._callback = callback
        self._button_colour = 'green'
        self._description_on = description_on
        self._description_off = description_off
        self._button = ipw.Button(description=self._description_on if self._state else self._description_off,
                                  layout=ipw.Layout(margin='auto',
                                                    border='none'))
        self._button.on_click(lambda _: self.on_click())
        
        if self._state:
            self._button.style.button_color = self.button_colour
        else:
            self._button.style.button_color = 'rgb(128, 128, 128)'
            
    @property
    def button_colour(self):
        return self._button_colour
    
    @button_colour.setter
    def button_colour(self, button_colour):
        self._button_colour = button_colour
        if self._state:
            self._button.style.button_color = self._button_colour
            
    @property
    def value(self):
        return self._state
    
    @value.setter
    def value(self, state):
        self._state = state
        if self._state:
            self._button.style.button_color = self.button_colour
            self._button.description = self._description_on
        else:
            self._button.style.button_color = 'rgb(128, 128, 128)'
            self._button.description = self._description_off

    def configure_state(self, state):
        self.value = state
        self._callback({self._dict_id : self._state})
        
    def on_click(self):
        self._state = not self._state
        self._callback({self._dict_id : self._state})
        if self._state:
            self._button.style.button_color = self.button_colour
            self._button.description = self._description_on
        else:
            self._button.style.button_color = 'rgb(128, 128, 128)'
            self._button.description = self._description_off
            
    def get_widget(self):
        return self._button
    
    
class QuickButton():
    """Helper class for button widgets.
    """
    def __init__(self,
                 callback,
                 description_on = ' ',
                 description_off = ' ',
                 state = True,
                 dict_id = ''):
        self._state = state
        self._dict_id = dict_id
        self._callback = callback
        self._button_colour = 'green'
        self._description_on = description_on
        self._description_off = description_off
        self._button = ipw.Button(description=self._description_on if self._state else self._description_off,
                                  layout=ipw.Layout(margin='auto',
                                                    border='none'))
        self._button.on_click(lambda _: self.on_click())
        
        if self._state:
            self._button.style.button_color = self.button_colour
        else:
            self._button.style.button_color = 'rgb(128, 128, 128)'
            
    @property
    def button_colour(self):
        return self._button_colour
    
    @button_colour.setter
    def button_colour(self, button_colour):
        self._button_colour = button_colour
        if self._state:
            self._button.style.button_color = self._button_colour
            
    @property
    def value(self):
        return self._state
    
    @value.setter
    def value(self, state):
        self._state = state
        if self._state:
            self._button.style.button_color = self.button_colour
            self._button.description = self._description_on
        else:
            self._button.style.button_color = 'rgb(128, 128, 128)'
            self._button.description = self._description_off
        
    def on_click(self):
        
        if self._state:
            self._button.style.button_color = 'rgb(128, 128, 128)'
            self._button.description = self._description_off
            self._callback()
            self._button.style.button_color = self.button_colour
            self._button.description = self._description_on
        else:
            self._button.style.button_color = self.button_colour
            self._button.description = self._description_on
            self._callback()
            self._button.style.button_color = 'rgb(128, 128, 128)'
            self._button.description = self._description_off
            
    def get_widget(self):
        return self._button
    
    
class Accordion():
    """Helper class for accordion widgets.
    """
    def __init__(self,
                 title, 
                 widgets,
                 callback=None,
                 dict_id='',
                 selected_index=0):
        
        def on_value_change(change):
            if self._callback is not None:
                if change['new'] is None:
                    self._callback(self._dict_id, change['new'])
        
        self._title = title
        self._widgets = widgets
        self._vbox = ipw.VBox([])
        self._callback = callback
        
        for i in range(len(self._widgets)):
            self._vbox.children+=(self._widgets[i],)
        self._accordion = ipw.Accordion(children=[self._vbox],
                                        layout=ipw.Layout(width='auto'),
                                        selected_index=selected_index)
        self._accordion.set_title(0, self._title)
        self._accordion.observe(callback, names='selected_index')
        
    @property
    def selected_index(self):
        return self._accordion.selected_index
    
    @selected_index.setter
    def selected_index(self, selected_index):
        self._accordion.selected_index = selected_index

    def get_widget(self):
        return self._accordion
    
    
class Image():
    """Helper class for displaying images.
    """
    def __init__(self,
                 image_file,
                 image_format='png',
                 width=200,
                 height=200):
        
        file = open(image_file, "rb")
        image = file.read()
        self._image = ipw.Image(value=image,
                  format=image_format,
                  width=width,
                  height=height)
        
    def update_image(self, image_file):
        file = open(image_file, "rb")
        image = file.read()
        self._image.value = image
        
    def get_widget(self):
        return self._image