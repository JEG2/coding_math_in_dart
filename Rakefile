require "fileutils"

PUBSPEC = <<END_YAML
name: %<name>s
description: Episode %<number>d
dependencies:
  browser: any
END_YAML

HTML = <<END_HTML
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">

    <title>%<name>s</title>

    <style type="text/css">
      html, body {
        margin: 0px;
      }

      canvas {
        display: block;
      }
    </style>
  </head><body>
    <canvas id="screen"></canvas>

    <script src="episode.dart" type="application/dart" charset="utf-8"></script>
    <script src="packages/browser/dart.js" type="text/javascript" charset="utf-8"></script>
  </body>
</html>
END_HTML

DART = <<END_DART
import "dart:html";

void main() {
  var canvas  = querySelector("#screen");
  var context = canvas.getContext("2d");
  var width   = window.innerWidth;
  var height  = window.innerHeight;

  canvas.width  = width;
  canvas.height = height;

  // ...
}
END_DART

desc "Adds the scaffolding for a new episode"
task :add_episode do
  name   = ENV["EPISODE_NAME"] or
    abort "Usage:  rake add_episode EPISODE_NAME=name"
  latest = Dir.entries(Dir.pwd).grep(/\A\d/).sort.last || "0"
  number = latest.to_i + 1
  dir    = "%03d_%s" % [number, name]

  FileUtils.mkdir_p("%03d_%s/web" % [latest.to_i + 1, name])
  File.write( File.join(dir, "pubspec.yaml"),
              PUBSPEC % {name: name, number: number} )
  File.write( File.join(dir, "web", "index.html"),
              HTML % {name: name, number: number} )
  File.write( File.join(dir, "web", "episode.dart"),
              DART % {name: name, number: number} )
  sh "cd #{dir} && pub get"
end
