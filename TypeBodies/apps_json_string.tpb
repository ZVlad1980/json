create or replace type body apps_json_string is

  constructor function apps_json_string return self as result is
  begin
    return;
  end;

  constructor function apps_json_string(
    p_node_name  varchar2,
    p_node_value varchar2
  ) return self as result is
  begin
    self.node_name(p_node_name);
    self.node_value(p_node_value);
    return;
  end;
  constructor function apps_json_string(
    p_node_value varchar2
  ) return self as result is
  begin
    self.node_value(p_node_value);
    return;
  end;
  --
  overriding member function node_type return varchar2 is
  begin
    return apps_json_api.C_TYPE_STRING;
  end;
  --
  overriding member function to_string return varchar2 is
  begin
    return self.node_name_full() || self.encode(self.node_value);
  end;

  member procedure node_value(
    p_node_value varchar2
  ) is
  begin
    self.node_value$ := substr(p_node_value, 1, 4000);
  end node_value;

  member function node_value return varchar2 is
  begin
    return self.node_value$;
  end node_value;

end;
/