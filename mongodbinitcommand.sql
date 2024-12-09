db.createCollection("manufacturers", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["code", "name"],
      properties: {
        code: { bsonType: "int" },
        name: { bsonType: "string", maxLength: 50 }
      }
    }
  }
});

db.createCollection("products", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["code", "name", "price", "manufacturerId"],
      properties: {
        code: { bsonType: "int" },
        name: { bsonType: "string", maxLength: 50 },
        price: { bsonType: "double" },
        manufacturerId: { bsonType: "int" }
      }
    }
  }
});

db.createCollection("productTypes", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["productTypeCd", "name"],
      properties: {
        productTypeCd: { bsonType: "string", maxLength: 10 },
        name: { bsonType: "string", maxLength: 50 }
      }
    }
  }
});

db.createCollection("products", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["name"],
      properties: {
        name: { bsonType: "string", maxLength: 50 },
        productTypeCd: { bsonType: "string", maxLength: 10 },
        dateOffered: { bsonType: "date" },
        dateRetired: { bsonType: "date" }
      }
    }
  }
});

db.createCollection("accounts", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["accountId"],
      properties: {
        accountId: { bsonType: "int" },
        productCd: { bsonType: "string", maxLength: 10 },
        custId: { bsonType: "int" },
        openDate: { bsonType: "date" },
        closeDate: { bsonType: "date" },
        lastActivityDate: { bsonType: "date" },
        status: { bsonType: "string", maxLength: 10 },
        openBranchId: { bsonType: "int" },
        openEmpId: { bsonType: "int" },
        availBalance: { bsonType: "double" },
        pendingBalance: { bsonType: "double" },
        productName: { bsonType: "string", maxLength: 50 }
      }
    }
  }
});

db.createCollection("customers", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["custId", "fedId", "custTypeCd"],
      properties: {
        custId: { bsonType: "int" },
        fedId: { bsonType: "string", maxLength: 12 },
        custTypeCd: { enum: ["I", "B"] },
        address: { bsonType: "string", maxLength: 30 },
        city: { bsonType: "string", maxLength: 20 },
        state: { bsonType: "string", maxLength: 20 },
        postalCode: { bsonType: "string", maxLength: 10 }
      }
    }
  }
});

db.createCollection("business", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["custId", "name", "stateId", "incorporationDate"],
      properties: {
        custId: { bsonType: "int" },
        name: { bsonType: "string", maxLength: 40 },
        stateId: { bsonType: "string", maxLength: 10 },
        incorporationDate: { bsonType: "date" }
      }
    }
  }
});

db.createCollection("individual", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["custId", "firstName", "lastName", "birthDate"],
      properties: {
        custId: { bsonType: "int" },
        firstName: { bsonType: "string", maxLength: 30 },
        lastName: { bsonType: "string", maxLength: 30 },
        birthDate: { bsonType: "date" }
      }
    }
  }
});

db.createCollection("officer", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["officerId", "custId", "firstName", "lastName", "title", "startDate"],
      properties: {
        officerId: { bsonType: "int" },
        custId: { bsonType: "int" },
        firstName: { bsonType: "string", maxLength: 30 },
        lastName: { bsonType: "string", maxLength: 30 },
        title: { bsonType: "string", maxLength: 20 },
        startDate: { bsonType: "date" },
        endDate: { bsonType: "date" }
      }
    }
  }
});

db.createCollection("person", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      properties: {
        personId: { bsonType: "int" },
        firstName: { bsonType: "string", maxLength: 20 },
        lastName: { bsonType: "string", maxLength: 20 },
        gender: { bsonType: "string", maxLength: 1 },
        birthDate: { bsonType: "date" },
        street: { bsonType: "string", maxLength: 30 },
        city: { bsonType: "string", maxLength: 20 },
        state: { bsonType: "string", maxLength: 20 },
        country: { bsonType: "string", maxLength: 20 },
        postalCode: { bsonType: "string", maxLength: 20 }
      }
    }
  }
});

db.createCollection("transaction", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["txnId"],
      properties: {
        txnId: { bsonType: "int" },
        txnDate: { bsonType: "date" },
        accountId: { bsonType: "int" },
        txnTypeCd: { bsonType: "string", maxLength: 10 },
        amount: { bsonType: "double" },
        tellerEmpId: { bsonType: "int" },
        executionBranchId: { bsonType: "int" },
        fundsAvailDate: { bsonType: "date" }
      }
    }
  }
});

-- Indexes for the collections.
db.manufacturers.createIndex({ "code": 1 }, { unique: true });
db.products.createIndex({ "manufacturerId": 1 });
db.accounts.createIndex({ "custId": 1 });
db.customers.createIndex({ "custId": 1 }, { unique: true });
db.transaction.createIndex({ "accountId": 1 });
