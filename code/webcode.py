from flask import *
import pymysql
app=Flask(__name__)
con=pymysql.connect(host="localhost",user="root",passwd="",port=3306,db="public_complaint_sorting")
cmd=con.cursor()
app.secret_key="ab"

@app.route('/')
def start():
  return render_template("login.html")

@app.route('/login',methods=['get','post'])
def login():
    username=request.form['textfield']
    password=request.form['textfield2']
    cmd.execute("select * from login where `User name`='"+username+"' and password='"+password+"'")
    s=cmd.fetchone()
    if s is None:
           return  '''<script>alert("invalid");window.location="/"</script>'''
    elif s[3]=="admin":
        session['alid']=s[0]
        return '''<script>alert("login success");window.location="/home"</script>'''
    elif s[3]=="staff":
        session['alid']=s[0]
        print(session['alid'])
        return '''<script>alert("login success");window.location="/office_home"</script>'''






@app.route('/home')
def home():
  return render_template("home.html")

@app.route('/view_staff')
def view_staff():
  cmd.execute("SELECT *FROM staff")
  s=cmd.fetchall()
  return render_template("view staff.html",val=s)




@app.route('/add_staff',methods=['post'])
def add_staff():
  return render_template("add staff.html")

@app.route('/add_staff1',methods=['post'])
def add_staff1():
    name=request.form['textfield']
    place = request.form['textfield2']
    post = request.form['textfield3']
    pin = request.form['textfield4']
    phoneno = request.form['textfield5']
    email = request.form['textfield6']
    username = request.form['textfield7']
    password = request.form['textfield8']

    cmd.execute("insert into login values(null,'"+username+"','" +password+"','staff')")
    id=con.insert_id()
    cmd.execute("insert into staff values(null,'"+str(id)+"','"+name+"','"+place+"','"+post+"','"+pin+"','"+phoneno+"','"+email+"')")
    con.commit()
    return '''<script>alert("Success");window.location="/home"</script>'''


@app.route('/staff_update')
def staff_update():
    id=request.args.get('id')
    session['staff_id1']=id
    cmd.execute("select * from staff where login_id='"+str(id)+"'")
    s=cmd.fetchone()
    return render_template("staff_update.html",val=s)

@app.route('/staff_delete')
def staff_delete():
    id = request.args.get('id')
    cmd.execute("delete from staff where login_id='"+str(id)+"'")
    con.commit()
    return '''<script>alert("Deleted");window.location="/view_staff"</script>'''


@app.route('/staff_update1',methods=['post'])
def staff_update1():
    staffname = request.form['textfield']
    Place = request.form['textfield2']
    Post = request.form['textfield3']
    Pin = request.form['textfield4']
    Phoneno = request.form['textfield5']
    Email = request.form['textfield6']

    cmd.execute("update staff set staff_name='"+staffname+"',Place='"+Place+"',Post='"+Post+"',Pin='"+Pin+"',`phone no`='"+Phoneno+"',email='"+Email+"' where login_id='"+str(session['staff_id1'])+"'")
    con.commit()
    return '''<script>alert("Success");window.location="/view_staff"</script>'''





@app.route('/send_notification')
def send_notification():
  return render_template("send notification.html")

@app.route('/send_notification1',methods=['post'])
def send_notification1():
  feed=request.form['textarea']
  cmd.execute("insert into notification values(null,'"+feed+"',curdate())")
  con.commit()
  return '''<script>alert("Success");window.location="/home"</script>'''


@app.route('/feedback1')
def feedback1():
    cmd.execute("SELECT `feedback`.*,`user`.`Username` FROM `user` JOIN `feedback` ON `feedback`.`uid`=`user`.`Lid`")
    s=cmd.fetchall()
    return render_template("feedback1.html",val=s)



@app.route('/office_home')
def office_home():
  return render_template("office home.html")

@app.route('/office_viewprofile')
def office_viewprofile():
  cmd.execute("select * from staff where login_id='"+str(session['alid'])+"'")
  s=cmd.fetchone()
  return render_template("office-viewprofile.html",val=s)

# @app.route('/office_view_notification')
# def office_view_notification():
#     return render_template("office-view notification.html",val=s)

@app.route('/office_view_notification1')
def office_view_notification1():
    cmd.execute("select * from notification")
    s = cmd.fetchall()
    print("s",s)
    return render_template("office-view notification.html",val=s)



@app.route('/office_viewsend_replay')
def office_viewsend_replay():
    cmd.execute("SELECT complaint.*,user.Username FROM complaint JOIN USER ON complaint.Lid=user.Lid AND complaint.Replay='pending'")
    s = cmd.fetchall()
    return render_template("office-view &send replay.html",val=s)

@app.route('/office_send_replay')
def office_send_replay():
  id=request.args.get('id')
  session['id']=id
  print(id)
  return render_template("office-send replay.html")



@app.route('/replay1',methods=['get','post'])
def replay1():
    replay=request.form['textfield']
    cmd.execute("UPDATE complaint SET Replay='"+replay+"' WHERE id='"+str(session['id'])+"'")
    con.commit()
    return '''<script>alert("success");window.location="/office_home"</script>'''


app.run(debug=True)