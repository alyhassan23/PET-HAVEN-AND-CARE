import bodyParser from "body-parser";
import express from "express";
import mysql from "mysql";

const app = express();
const port = 3000;

app.use(express.static("public"));
app.use(bodyParser.urlencoded({ extended: true }));

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "pet_adoption12",
});

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log("MySQL connected...");
});

app.get("/", (req, res) => {
  res.render("login.ejs");
});

app.get("/home", (req, res) => {
  res.render("index.ejs");
});

app.get("/register", (req, res) => {
  res.render("register_page.ejs");
});

app.get("/addpet", (req, res) => {
  res.render("addpet.ejs");
});
app.get("/updateForm", (req, res) => {
  res.render("form.ejs");
});
app.get("/deletepet", (req, res) => {
  res.render("deletePet.ejs");
});

app.get("/pets", (req, res) => {
  const sql = "SELECT * FROM Pets";
  db.query(sql, (err, result) => {
    if (err) {
      console.error("Error occurred during fetching pets: ", err);
      return res.send("Error occurred");
    }
    res.render("petTable.ejs", { pets: result });
  });
});

app.get("/employees", (req, res) => {
  const sql = "SELECT * FROM Employees";
  db.query(sql, (err, result) => {
    if (err) {
      console.error("Error occurred during fetching Employee: ", err);
      return res.send("Error occurred");
    }
    res.render("employee.ejs", { Employees: result });
  });
});

app.post("/register", (req, res) => {
  const { name, username, password } = req.body;
  const checkQuery = "SELECT * FROM credentials WHERE username = ?";
  const insertQuery =
    "INSERT INTO credentials (name, username, password) VALUES (?, ?, ?)";

  db.query(checkQuery, [username], (checkErr, checkResult) => {
    if (checkErr) {
      console.log(checkErr);
      return res.send("Error occurred");
    }
    if (checkResult.length > 0) {
      res.send("User already exists, try to login.");
    } else {
      db.query(
        insertQuery,
        [name, username, password],
        (insertErr, insertResult) => {
          if (insertErr) {
            console.log(insertErr);
            return res.send("Error occurred");
          }
          console.log(insertResult);
          res.render("index.ejs");
        },
      );
    }
  });
});

app.post("/", (req, res) => {
  const { username, password } = req.body;
  const loginQuery = "SELECT * FROM credentials WHERE username = ?";

  db.query(loginQuery, [username], (loginErr, loginResult) => {
    if (loginErr) {
      console.log(loginErr);
      return res.send("Error occurred");
    }
    if (loginResult.length > 0) {
      const result = loginResult[0];
      const storedPassword = result.password;
      if (storedPassword === password) {
        res.render("index.ejs");
      } else {
        res.send("Invalid password");
      }
    } else {
      res.send("No user exists. Register first");
    }
  });
});

app.post("/addPet", (req, res) => {
  const newPet = {
    Name: req.body.name,
    Species: req.body.species,
    Breed: req.body.breed,
    Age: req.body.age,
    Gender: req.body.gender,
    Size: req.body.size,
    Color: req.body.color,
    HealthStatus: req.body.healthStatus,
    ArrivalDate: req.body.arrivalDate,
    Status: req.body.status,
  };

  const sql = "INSERT INTO Pets SET ?";
  db.query(sql, newPet, (err, result) => {
    if (err) {
      throw err;
    }
    console.log("Pet added...");
    res.redirect("/addPet");
  });
});

app.post("/updateAdopter", (req, res) => {
  const adopterId = req.body.id;
  console.log(`Fetching adopter with ID: ${adopterId}`); // Log the adopterId
  const sql = "SELECT * FROM Adopters WHERE AdopterID = ?";
  db.query(sql, [adopterId], (err, result) => {
    if (err) {
      console.error("Error occurred during fetching adopter: ", err);
      return res.send("Error occurred");
    }
    console.log(`Query result: ${JSON.stringify(result)}`); // Log the query result
    if (result.length === 0) {
      return res.send("Adopter not found");
    }
    res.render("updateAdoptors.ejs", { adopter: result[0] });
  });
});

app.post("/updateAdopter/:id", (req, res) => {
  const adopterId = req.params.id;
  const updatedAdopter = {
    FirstName: req.body.firstName,
    LastName: req.body.lastName,
    Address: req.body.address,
    City: req.body.city,
    State: req.body.state,
    ZipCode: req.body.zipCode,
    PhoneNumber: req.body.phoneNumber,
    Email: req.body.email,
    AdoptionHistory: req.body.adoptionHistory,
  };

  console.log(`Updating adopter with ID: ${adopterId}`); // Log the adopterId
  console.log(`Updated adopter data: ${JSON.stringify(updatedAdopter)}`); // Log the updated data

  const sql = "UPDATE Adopters SET ? WHERE AdopterID = ?";
  db.query(sql, [updatedAdopter, adopterId], (err, result) => {
    if (err) {
      console.error("Error occurred during updating adopter: ", err);
      return res.send("Error occurred");
    }
    console.log("Adopter updated...");
    // res.redirect("/updateAdopter");
    res.send("UPDATE SUCCESSFULL");
  });
});

app.post("/updateEmployee", (req, res) => {
  const EmployeeID = req.body.id;
  const sql = "DELETE FROM Employees WHERE EmployeeID = ?";
  db.query(sql, [EmployeeID], (err, result) => {
    if (err) {
      console.log(err);
      return res.send("Error occurred");
    }
    console.log("Employee deleted...");
    const fetchSql = "SELECT * FROM Employees";
    db.query(fetchSql, (fetchErr, fetchResult) => {
      if (fetchErr) {
        console.log(fetchErr);
        return res.send("Error occurred while fetching updated employee list");
      }
      res.render("employee.ejs", { Employees: fetchResult });
    });
  });
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
