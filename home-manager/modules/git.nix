{
  gh-email,
  gh-username,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "${gh-username}";
    userEmail = "${gh-email}";

    extraConfig = {
      credential = {
        helper = "store";
      };
      url."https://github.com/" = {
        insteadOf = [
          "gh:"
          "github:"
        ];
      };
    };
  };
}
