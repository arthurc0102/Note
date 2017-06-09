var gulp = require('gulp');  // 將 node_modules 的檔案載入
var sass = require('gulp-sass');

gulp.task('sass', function () {     // 定義 sass 的任務名稱
  return gulp.src('./sass/**/*.scss') // sass 的來源資料夾
    .pipe(sass(                     // 編譯 sass
      {outputStyle: 'expanded'}     // sass 的輸出格式
    ).on('error', sass.logError))
    .pipe(gulp.dest('./public')); // sass 編譯完成後的匯出資料夾
});

gulp.task('sass:watch', function () {
  gulp.watch('./sass/**/*.scss', ['sass']);
  // 監控資料夾，當有變化時執行 'sass' 任務
});

// 參考： http://ithelp.ithome.com.tw/articles/10185565
