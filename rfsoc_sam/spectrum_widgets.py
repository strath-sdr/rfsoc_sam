import ipywidgets as ipw   
    
def image_widget(path):
    file = open(path, "rb")
    image = file.read()
    return ipw.Image(
        value=image,
        format='png',
        layout=ipw.Layout(width='auto')
    )
        
def float_txt_widget(title, value, min, max, step):
    style = {'description_width': 'initial'}
    return ipw.BoundedFloatText(
        value=value,
        min=min,
        max=max,
        step = step,
        description=title,
        disabled=False,
        continuous_update=True,
        orientation='horizontal',
        readout=True,
        readout_format='.1f',
        style=style,
        layout=ipw.Layout(width='auto'),
    )
    
def drop_menu_widget(title, value, options):
    style = {'description_width': 'initial'}
    return ipw.Dropdown(
        options=options,
        value=value,
        description=title,
        disabled=False,
        style=style,
        layout=ipw.Layout(width='auto'),
    )
             
def int_slide_widget(title, value, min, max, step):
    style = {'description_width': 'initial'}
    return ipw.IntSlider(
        value=value,
        min=min,
        max=max,
        step=step,
        description=title,
        disabled=False,
        continuous_update=False,
        orientation='horizontal',
        readout=True,
        style=style,
        readout_format='d',
        layout=ipw.Layout(width='auto')
    )

def float_slide_widget(title, value, min, max, step):
    style = {'description_width': 'initial'}
    return ipw.FloatSlider(
        value=value,
        min=min,
        max=max,
        step=step,
        description=title,
        disabled=False,
        continuous_update=False,
        orientation='horizontal',
        readout=True,
        style=style,
        readout_format='.2f',
        layout=ipw.Layout(width='auto')
    )

def check_box_widget(title, value):
    style = {'description_width': 'initial'}
    return ipw.Checkbox(
        value=value,
        description=title,
        disabled=False,
        indent=False,
        layout=ipw.Layout(width='auto'),
        style=style
    )
    
def accordion_widget(title, widgets):
    vbox = ipw.VBox([])
    for i in range(len(widgets)):
        vbox.children+=(widgets[i],)
    accordion = ipw.Accordion(children=[vbox],layout=ipw.Layout(width='auto'))
    accordion.set_title(0, title)

    return accordion

def int_range_widget(title, value, min, max, step):
    style = {'description_width': 'initial'}
    return ipw.IntRangeSlider(
    value=value,
    min=min,
    max=max,
    step=step,
    description=title,
    disabled=False,
    continuous_update=False,
    orientation='horizontal',
    readout=True,
    readout_format='d',
    layout=ipw.Layout(width='auto'),
    style=style
)