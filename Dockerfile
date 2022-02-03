FROM nginx
COPY bmi-calc /usr/share/nginx/html
COPY bmi-calc/static /usr/share/nginx/html/bmi-calculator/static
