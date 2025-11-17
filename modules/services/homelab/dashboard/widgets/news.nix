{
  type = "group";
  # type = "split-column";
  widgets = [
    {
      type = "hacker-news";
      limit = 20;
      collapse-after = 4;
    }
    {
      type = "lobsters";
      limit = 20;
      collapse-after = 4;
    }
  ];
}
