create type apps_json_string under apps_json_node (
  node_value$ varchar2(4000),
  --
  constructor function apps_json_string return self as result,
  constructor function apps_json_string(
    p_node_name  varchar2,
    p_node_value varchar2
  ) return self as result,
  constructor function apps_json_string(
    p_node_value varchar2
  ) return self as result,
  --
  overriding member function node_type return varchar2,
  overriding member function to_string return varchar2,
  --
  member procedure node_value(
    p_node_value varchar2
  ),
  member function node_value return varchar2
) not final
/