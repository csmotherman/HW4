library(MASS)
library(ggplot2)
library(gridExtra)
cars93 <- MASS::Cars93
ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = FALSE, method = "loess", formula = y ~ x, color = "#0072B2") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")

gg_lm <- ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(method = "lm", se = TRUE, aes(color = "LM")) +
  labs(title = "LM") +
  scale_color_manual(values = c("LM" = "#8fe388"), guide = FALSE) +
  theme(plot.title = element_text(size = 14, color = "#8fe388"))

gg_glm <- ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(method = "glm", se = TRUE, aes(color = "GLM")) +
  labs(title = "GLM") +
  scale_color_manual(values = c("GLM" = "#fe8d6d"), guide = FALSE) +
  theme(plot.title = element_text(size = 14, color = "#fe8d6d"))

gg_gam <- ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(method = "gam", se = TRUE, aes(color = "GAM")) +
  labs(title = "GAM") +
  scale_color_manual(values = c("GAM" = "#7c6bea"), guide = FALSE) +
  theme(plot.title = element_text(size = 14, color = "#7c6bea"))

grid.arrange(gg_lm, gg_glm, gg_gam)