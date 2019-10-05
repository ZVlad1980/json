create or replace type body apps_json_node is

  member procedure node_name(
    p_node_name varchar2
  ) is
  begin
    self.node_name$ := substr(p_node_name, 1, 32);
  end node_name;

  member function node_name return varchar2 is
  begin
    return self.node_name$;
  end node_name;

  member function node_name_full return varchar2 is
    l_result varchar2(15);
  begin
    l_result := self.node_name;
    return case when l_result is not null then self.encode(l_result) || ':' end;
  end node_name_full;

  member function encode(
    p_string varchar2
  ) return varchar2 is
  begin
    return '"' || replace(p_string, '"', '\\"') || '"';
  end encode;
end;
/