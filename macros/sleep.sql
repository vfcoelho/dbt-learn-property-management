{% macro sleep(seconds=5) %}

    {% do run_query("select SYSTEM$WAIT("~seconds~")") %}
    {{seconds}}

{% endmacro %}

--comment here