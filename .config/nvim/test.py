import manim as mn


class SquareToCircle(Scene):
    def construct(self):
        circle = mn.Circle()
        square = mn.Square()
        square.flip(RIGHT)
        square.rotate(-3 * TAU / 8)
        circle.set_fill(PINK, opacity=0.5)

        self.play(mn.Create(square))
        self.play(mn.Transform(square, circle))
        self.play(mn.FadeOut(square))
