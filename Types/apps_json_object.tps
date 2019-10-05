create type apps_json_object under apps_json_node (
  --
  attributes apps_json_nodes,
  --
  constructor function apps_json_object return self as result,
  constructor function apps_json_object(
    p_attributes  apps_json_nodes
  ) return self as result,
  constructor function apps_json_object(
    p_attr1  apps_json_node,
    p_attr2  apps_json_node default null,
    p_attr3  apps_json_node default null,
    p_attr4  apps_json_node default null,
    p_attr5  apps_json_node default null,
    p_attr6  apps_json_node default null,
    p_attr7  apps_json_node default null,
    p_attr8  apps_json_node default null,
    p_attr9  apps_json_node default null
  ) return self as result,
  --
  overriding member function node_type return varchar2,
  overriding member function to_string return varchar2,
  --
  member procedure add_attribute(
    p_attribute        apps_json_node,
    p_attribute_name   varchar2 default null
  ),
  member function a(
    p_attribute_name  varchar2,
    p_attribute_value varchar2
  ) return apps_json_string,
  member procedure a(
    p_attribute_name  varchar2,
    p_attribute_value varchar2
  ),
  member procedure a(
    p_attribute_name  varchar2,
    p_attribute_value apps_json_node
  ),
  member procedure a(
    p_attr1  apps_json_node default null,
    p_attr2  apps_json_node default null,
    p_attr3  apps_json_node default null,
    p_attr4  apps_json_node default null,
    p_attr5  apps_json_node default null,
    p_attr6  apps_json_node default null,
    p_attr7  apps_json_node default null,
    p_attr8  apps_json_node default null,
    p_attr9  apps_json_node default null,
    p_attrs  apps_json_nodes default null
  ),
  member function o(
    p_attributes  apps_json_nodes
  ) return apps_json_object,
  member function o(
    p_attr1  apps_json_node,
    p_attr2  apps_json_node default null,
    p_attr3  apps_json_node default null,
    p_attr4  apps_json_node default null,
    p_attr5  apps_json_node default null,
    p_attr6  apps_json_node default null,
    p_attr7  apps_json_node default null,
    p_attr8  apps_json_node default null,
    p_attr9  apps_json_node default null
  ) return apps_json_object,
  member function array(
    p_elements  apps_json_nodes
  ) return apps_json_array,
  member function el(
    p_value varchar2
  ) return apps_json_node
) not final
/