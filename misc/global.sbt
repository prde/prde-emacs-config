import org.ensime.EnsimeKeys._

ensimeJavaFlags in ThisBuild := Seq("-Xss2m", "-Xmx2g", "-XX:MaxMetaspaceSize=512m")
