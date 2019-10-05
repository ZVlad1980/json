create type apps_json_node as object (
  node_name$ varchar2(32),
  version    varchar2(10),
  --
  member procedure node_name(
    p_node_name varchar2
  ),
  member function node_name return varchar2,
  member function node_name_full return varchar2,
  member function encode(
    p_string varchar2
  ) return varchar2,
  --
  not instantiable member function node_type return varchar2,
  not instantiable member function to_string return varchar2
) not final
  not instantiable
/