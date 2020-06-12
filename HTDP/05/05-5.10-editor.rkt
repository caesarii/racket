;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 05-5.10-editor) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)

(define Height 20)
(define Middle (/ Height 2))

; struct editor
(define-struct editor (pre post))

; 绘制文本
(define (draw-text str)
  (text str 11 "black"))

; 绘制pre
(define (text-pre editor)
  (draw-text (editor-pre editor)))

; 绘制post
(define (text-post editor)
  (draw-text (editor-post editor)))

; 获取caret位置
(define (start-caret editor)
  (image-width (text-pre editor)))

; 垂直居中水平排列
(define (place-image-center image x scene)
  (place-image/align image x Middle "left" "center" scene))

; 字符串 获取第一个字符
(define (string-first s)
  (substring s 0 1))

; 删除第一个字符
(define (string-else-first s)
  (substring s 1 (string-length s)))

; 获取最后一个字符
(define (string-last s)
  (substring s (- (string-length s) 1) (string-length s)))

; 删除最后一个字符
(define (string-else-last s)
  (substring s 0 (- (string-length s) 1)))

; 绘制editor
(define (draw-editor editor)
  (place-image-center
   (text-pre editor)
   0
   (place-image-center
    (line 0 Height "red")
    (start-caret editor)
    (place-image-center (text-post editor) (+ 1 (start-caret editor)) (empty-scene 200 20)))))
            
; editor 处理输入, 删除, 左右键, 其他当做输入
(define (editor-process editor ke)
  (cond
    [(key=? ke "\b") (editor-del editor)]`
    [(key=? ke "left") (editor-left editor)]
    [(key=? ke "right") (editor-right editor)]
    [else (editor-input editor ke)]))

; 处理右键
(define (editor-right editor)
  (make-editor
   (string-append
    (editor-pre editor)
    (string-first (editor-post editor)))
   (string-else-first (editor-post editor))))

; 处理左键
(define (editor-left editor)
  (make-editor
   (string-else-last (editor-pre editor))
   (string-append
    (string-last (editor-pre editor))
     (editor-post editor))))
; 处理删除
(define (editor-del editor)
  (make-editor
    (substring (editor-pre editor) 0 (- (string-length (editor-pre editor)) 1))
    (editor-post editor)))

; 处理其他键
(define (editor-input editor ke)
  (make-editor (string-append (editor-pre editor) ke) (editor-post editor)))
; (draw-editor (make-editor "hello" "world"))


(define (main p0)
  (big-bang p0
    [on-key editor-process]
    [to-draw draw-editor]
    ))

(main (make-editor "hello" "world"))
          