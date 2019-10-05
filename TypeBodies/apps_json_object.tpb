create or replace type body apps_json_object is

  constructor function apps_json_object return self as result is
  begin
    self.attributes := apps_json_nodes();
    return;
  end;

  constructor function apps_json_object(
    p_attributes  apps_json_nodes
  ) return self as result is
  begin
    self.attributes := p_attributes;
    return;
  end;

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
  ) return self as result is
  begin
    self := apps_json_object();
    self.a(
      p_attr1 => p_attr1,
      p_attr2 => p_attr2,
      p_attr3 => p_attr3,
      p_attr4 => p_attr4,
      p_attr5 => p_attr5,
      p_attr6 => p_attr6,
      p_attr7 => p_attr7,
      p_attr8 => p_attr8,
      p_attr9 => p_attr9
    );
    return;
  end;
  --
  overriding member function node_type return varchar2 is
  begin
    return apps_json_api.C_TYPE_OBJECT;
  end;
  --
  overriding member function to_string return varchar2 is
    l_result varchar2(32767);
  begin
    for i in 1..self.attributes.count loop
      l_result := l_result || case when i > 1 then ',' end || self.attributes(i).to_string();
    end loop;
    return self.node_name_full() || '{' || l_result || '}';
  end to_string;

  member procedure add_attribute(
    p_attribute        apps_json_node,
    p_attribute_name   varchar2 default null
  ) is
  begin
    if p_attribute is null then
      return;
    end if; 
    
    self.attributes.extend();
    self.attributes(self.attributes.count) := p_attribute;

    if p_attribute_name is not null then
      self.attributes(self.attributes.count).node_name(p_attribute_name);
    end if;

    if self.attributes(self.attributes.count).node_name is null then
      raise_application_error(-20000, 'Не задано имя атрибута');
    end if;
  end add_attribute;

  member function a(
    p_attribute_name  varchar2,
    p_attribute_value varchar2
  ) return apps_json_string is
  begin
    return apps_json_string(p_attribute_name, p_attribute_value);
  end a;

  member procedure a(
    p_attribute_name  varchar2,
    p_attribute_value varchar2
  ) is
  begin
    self.add_attribute(self.a(p_attribute_name, p_attribute_value));
  end a;
  
  member procedure a(
    p_attribute_name  varchar2,
    p_attribute_value apps_json_node
  ) is
  begin
    self.add_attribute(p_attribute_value, p_attribute_name);
  end a;

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
  ) is
  begin
    self.add_attribute(p_attribute => p_attr1);
    self.add_attribute(p_attribute => p_attr2);
    self.add_attribute(p_attribute => p_attr3);
    self.add_attribute(p_attribute => p_attr4);
    self.add_attribute(p_attribute => p_attr5);
    self.add_attribute(p_attribute => p_attr6);
    self.add_attribute(p_attribute => p_attr7);
    self.add_attribute(p_attribute => p_attr8);
    self.add_attribute(p_attribute => p_attr9);
    if p_attrs is not null then
      for i in 1..p_attrs.count loop
        self.add_attribute(p_attribute => p_attrs(i));
      end loop;
    end if;

  end a;

  member function o(
    p_attributes  apps_json_nodes
  ) return apps_json_object  is
  begin
    return apps_json_object(p_attributes);
  end o;

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
  ) return apps_json_object is
  begin
    return apps_json_object(
      p_attr1,
      p_attr2,
      p_attr3,
      p_attr4,
      p_attr5,
      p_attr6,
      p_attr7,
      p_attr8,
      p_attr9
    );
  end o;

  member function array(
    p_elements  apps_json_nodes
  ) return apps_json_array  is
  begin
    return apps_json_array(p_elements);
  end array;

  member function el(
    p_value varchar2
  ) return apps_json_node is
  begin
    return apps_json_string(p_value);
  end el;

end;
/