made<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>
    <link rel="stylesheet" href="index.css"> <!-- External CSS -->
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <!-- Profile Icon at Top -->
            <div class="profile-icon">
                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135768.png" alt="Student Icon">
            </div>

            <h2>Student Registration</h2>
            <hr>

            <form action="register" method="post">
                <div class="form-group">
                    <input type="text" name="fullname" placeholder="Full Name" required>
                </div>

                <div class="form-group">
                    <input type="email" name="email" placeholder="Email Address" required>
                </div>

                <div class="form-group">
                    <input type="tel" name="phone" placeholder="Phone Number" required>
                </div>

                <div class="form-group">
                    <input type="text" name="dob" placeholder="Select Date of Birth" onfocus="this.type='date'" required>

                </div>

                <div class="form-group">
                    <div class="gender-options">
                        <label><input type="radio" name="gender" value="Male"> Male</label>
                        <label><input type="radio" name="gender" value="Female"> Female</label>
                        <label><input type="radio" name="gender" value="Other"> Other</label>
                    </div>
                </div>

                <div class="form-group">
                    <input type="text" name="course" placeholder="Course" required>
                </div>

                <div class="form-group">
                    <select name="year" required>
                        <option value="">-- Select Year --</option>
                        <option value="1">1st Year</option>
                        <option value="2">2nd Year</option>
                        <option value="3">3rd Year</option>
                        <option value="4">4th Year</option>
                    </select>
                </div>



                <div class="form-group">
                    <textarea name="address" rows="3" placeholder="Address" required></textarea>
                </div>

                <button type="submit">Register</button>
            </form>
        </div>
    </div>
</body>
</html>
