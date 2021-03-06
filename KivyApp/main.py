from kivy.app import App
import kivy.uix.screenmanager as sp
from kivy.uix.label import Label
from kivy.properties import ObjectProperty
from back import functional as fn


class Main(App):
    main_screen = None
    plot_screen = None
    error_screen = None

    def build(self):
        sm = sp.ScreenManager()
        Main.input_screen = InputScreen(name='input')
        Main.plot_screen = PlotScreen(name='Plot')
        Main.error_screen = ErrorScreen(name='error')
        sm.add_widget(Main.input_screen)
        sm.add_widget(Main.plot_screen)
        sm.add_widget(Main.error_screen)

        return sm


class InputScreen(sp.Screen):
    inp_x0 = ObjectProperty(None)
    inp_y0 = ObjectProperty(None)
    inp_n = ObjectProperty(None)
    inp_xn = ObjectProperty(None)
    btn1 = ObjectProperty(None)

    def __init__(self, **kw):
        super().__init__(**kw)
        self.btn1.bind(on_press=self.callback1)
        self.btn2.bind(on_press=self.callback2)
        self.btn3.bind(on_press=self.callback3)
        self.btn4.bind(on_press=self.callback4)
        self.btn5.bind(on_press=self.callback5)
        self.btn6.bind(on_press=self.callback6)
        self.btn7.bind(on_press=self.callback7)
        self.btn8.bind(on_press=self.callback8)
        self.btn9.bind(on_press=self.callback9)
        self.btn10.bind(on_press=self.callback10)

    def callback1(self, instance):
        Main.plot_screen.main_box.remove_widget(Main.plot_screen.data)
        self.parent.transition = sp.SlideTransition(direction='left')
        data = self.inp_x0.text.replace(' ', '').split(',')
        username = data[0]
        date = data[1]
        color = data[2]
        plate = data[3]
        Main.plot_screen.data = Label(text=fn.select1(username, date, color, plate))
        Main.plot_screen.main_box.add_widget(Main.plot_screen.data)
        self.parent.current = "Plot"

    def callback2(self, instance):
        Main.plot_screen.main_box.remove_widget(Main.plot_screen.data)
        self.parent.transition = sp.SlideTransition(direction='left')
        Main.plot_screen.data = Label(text=str(fn.select2(self.inp_x1.text)))
        Main.plot_screen.main_box.add_widget(Main.plot_screen.data)
        self.parent.current = "Plot"

    def callback3(self, instance):
        Main.plot_screen.main_box.remove_widget(Main.plot_screen.data)
        self.parent.transition = sp.SlideTransition(direction='left')
        Main.plot_screen.data = Label(text=str(fn.select3(self.inp_x2.text)))
        Main.plot_screen.main_box.add_widget(Main.plot_screen.data)
        self.parent.current = "Plot"

    def callback4(self, instance):
        Main.plot_screen.main_box.remove_widget(Main.plot_screen.data)
        self.parent.transition = sp.SlideTransition(direction='left')
        Main.plot_screen.data = Label(text=str(fn.test4(self.inp_x3.text)))
        Main.plot_screen.main_box.add_widget(Main.plot_screen.data)
        self.parent.current = "Plot"

    def callback5(self, instance):
        Main.plot_screen.main_box.remove_widget(Main.plot_screen.data)
        self.parent.transition = sp.SlideTransition(direction='left')
        Main.plot_screen.data = Label(text=str(fn.select5(self.inp_x4.text)))
        Main.plot_screen.main_box.add_widget(Main.plot_screen.data)
        self.parent.current = "Plot"

    def callback6(self, instance):
        Main.plot_screen.main_box.remove_widget(Main.plot_screen.data)
        self.parent.transition = sp.SlideTransition(direction='left')
        Main.plot_screen.data = Label(text=str(fn.select6()))
        Main.plot_screen.main_box.add_widget(Main.plot_screen.data)
        self.parent.current = "Plot"

    def callback7(self, instance):
        Main.plot_screen.main_box.remove_widget(Main.plot_screen.data)
        self.parent.transition = sp.SlideTransition(direction='left')
        Main.plot_screen.data = Label(text=str(fn.select7()))
        Main.plot_screen.main_box.add_widget(Main.plot_screen.data)
        self.parent.current = "Plot"

    def callback8(self, instance):
        Main.plot_screen.main_box.remove_widget(Main.plot_screen.data)
        self.parent.transition = sp.SlideTransition(direction='left')
        Main.plot_screen.data = Label(text=str(fn.test8(self.inp_x7.text)))
        Main.plot_screen.main_box.add_widget(Main.plot_screen.data)
        self.parent.current = "Plot"

    def callback9(self, instance):
        Main.plot_screen.main_box.remove_widget(Main.plot_screen.data)
        self.parent.transition = sp.SlideTransition(direction='left')
        Main.plot_screen.data = Label(text=str(fn.select9(self.inp_x8.text)))
        Main.plot_screen.main_box.add_widget(Main.plot_screen.data)
        self.parent.current = "Plot"

    def callback10(self, instance):
        Main.plot_screen.main_box.remove_widget(Main.plot_screen.data)
        self.parent.transition = sp.SlideTransition(direction='left')
        data = self.inp_x9.text.replace(' ', '').split(',')
        date1 = data[0]
        date2 = data[1]
        Main.plot_screen.data = Label(text=str(fn.select10(date1, date2)))
        Main.plot_screen.main_box.add_widget(Main.plot_screen.data)
        self.parent.current = "Plot"

    def validate_data(self, arr):
        if float(self.inp_x0.text) > float(self.inp_xn.text) or float(self.inp_n.text) <= 10 or float(
                self.inp_y0.text) == 0:
            return False

        return True


class PlotScreen(sp.Screen):
    main_box = ObjectProperty(None)

    def __init__(self, **kw):
        super().__init__(**kw)
        self.data = Label(text='Krya')
        self.data.pos_hint = {'top': 1}
        self.main_box.add_widget(self.data)


class ErrorScreen(sp.Screen):
    main_box = ObjectProperty(None)
    small_box = ObjectProperty(None)

    def __init__(self, **kw):
        super().__init__(**kw)


if __name__ == '__main__':
    Main().run()
