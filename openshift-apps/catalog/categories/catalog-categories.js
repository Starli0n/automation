// Add a Featured category section at the top of the catalog
window.OPENSHIFT_CONSTANTS.CATALOG_CATEGORIES.unshift({
  // Required.  Must be unique
  id: "devops",
  // Required
  label: "Devops - Project",
  // Optional.  If specified, each item in the category will utilize this icon
  // as a default
  iconClassDefault: "font-icon icon-devops",
  items: [
    {
      // Required.  Must be unique
      id: "app",
      // Required
      label: "Devops App",
      // Optional.  If specified, defines a unique icon for this item
      iconClass: "font-icon icon-devops",
      // Optional.  If specified, enables matching other tag values to this
      // category item
      categoryAliases: [
        "app"
      ],
      // Optional.  If specified, will display below the item label
      description: "Devops project : App based on JBoss with Apache frontend" 
    },
    {
      // Required.  Must be unique
      id: "noname",
      // Required
      label: "noname",
    }
  ]
});
