{% test generic_test_positive_value(model, column_name, field) %}
Select {{ field }},
sum({{ column_name }}) as total_value
from {{ model }}
group by {{ field }}
having total_value < 0

{% endtest %}