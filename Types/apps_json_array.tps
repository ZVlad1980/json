create type apps_json_array under apps_json_node (
  elements apps_json_nodes,
  --
  constructor function apps_json_array return self as result,
  constructor function apps_json_array(
    p_elements   apps_json_nodes
  ) return self as result,
  --
  overriding member function node_type return varchar2,
  overriding member function to_string return varchar2

) not final
/