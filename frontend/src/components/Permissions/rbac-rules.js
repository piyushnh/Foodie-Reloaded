// Sourced from : https://auth0.com/blog/role-based-access-control-rbac-and-react-apps/#Handling-Authorization-in-React-Apps--the-Naive-Way

const rules = {
    restaurantManager: {
      static: ["menu:edit",]
    },
   
  };
  
  export default rules;