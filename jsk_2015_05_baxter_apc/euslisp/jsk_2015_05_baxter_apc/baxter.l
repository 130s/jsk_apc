;; vim: set ft=lisp:

(require "package://baxtereus/baxter-util.l")

(unless (find-package "JSK_2015_05_BAXTER_APC")
  (make-package "JSK_2015_05_BAXTER_APC"))

(defclass jsk_2015_05_baxter_apc::baxter-robot
  :super baxter-robot
  :slots ())
(defmethod jsk_2015_05_baxter_apc::baxter-robot
  (:init
    (&rest args)
    (send-super* :init args)
    (send (send self :rarm :end-coords)
          :newcoords (make-coords :pos #f(50 0 310)
                                  :rpy (float-vector 0 -pi/2 0)))
    (send (send self :larm :end-coords)
          :newcoords (make-coords :pos #f(50 0 310)
                                  :rpy (float-vector 0 -pi/2 0)))

    ;; hard-coded pose
    (sethash :fold-pose-upper (send self :get-val 'hard-coded-pose-table) #f(0.0 -7.80029 -1.12061 -82.9248 141.438 116.477 -6.48193 8.10791 7.80029 -1.12061 82.9248 141.438 -116.477 -6.48193 -8.10791))
    (sethash :fold-pose-middle (send self :get-val 'hard-coded-pose-table) #f(0.0 48.8672 -10.437 -80.6616 148.645 80.9033 1.38428 18.8745 -48.8672 -10.437 80.6616 148.645 -80.9033 1.38428 -18.8745))
    (sethash :fold-pose-lower (send self :get-val 'hard-coded-pose-table) #f(0.0 -7.27295 52.6465 -59.9414 91.582 123.574 13.3374 159.675 7.27295 52.6465 59.9414 91.582 -123.574 13.3374 -159.675))
    (sethash :fold-pose-back (send self :get-val 'hard-coded-pose-table) #f(0.0 97.4707 -2.39502 -94.5483 134.67 91.4062 8.70117 0.0 -97.4707 -2.39502 94.5483 134.67 -91.4062 8.70117 0.0))
    (sethash :fold-to-keep-object (send self :get-val 'hard-coded-pose-table) #f(0.0 77.1899 4.37256 -86.1548 123.904 11.8213 59.8096 74.5532 -77.1899 4.37256 86.1548 123.904 -11.8213 59.8096 -74.5532))
    (sethash :place-object-pose (send self :get-val 'hard-coded-pose-table) #f(0.0 5.05371 1.58203 -39.5068 89.3188 -1.29639 8.10791 100.085 -5.05371 1.58203 39.5068 89.3188 1.29639 8.10791 -100.085))
    (sethash :avoid-shelf-pose-a (send self :get-val 'hard-coded-pose-table)
             #f(0
                3.51562 -1.56006 -174.946 123.86 113.533 90.6372 -38.4961
                -3.51562 -1.56006 174.946 123.86 -113.533 90.6372 38.4961))
    (sethash :avoid-shelf-pose-b (send self :get-val 'hard-coded-pose-table)
             #f(0
                37.4634 -29.3774 -142.449 117.883 -82.0679 -18.8306 123.882
                -37.4634 -29.3774 142.449 117.883 82.0679 -18.8306 -123.882))
    (sethash :avoid-shelf-pose-c (send self :get-val 'hard-coded-pose-table)
             #f(0
                3.51562 -1.56006 -174.946 123.86 113.533 90.6372 -38.4961
                -3.51562 -1.56006 174.946 123.86 -113.533 90.6372 38.4961))
    (sethash :avoid-shelf-pose-d (send self :get-val 'hard-coded-pose-table)
             #f(0
                79.8926 -14.2822 -125.793 148.271 -46.3623 -4.24072 100.063
                -79.8926 -14.2822 125.793 148.271 46.3623 -4.24072 -100.063))
    (sethash :avoid-shelf-pose-e (send self :get-val 'hard-coded-pose-table)
             #f(0
                54.1406 -52.8662 -130.583 142.8 3.27393 -32.5854 27.5098
                -54.1406 -52.8662 130.583 142.8 -3.27393 -32.5854 -27.5098))
    (sethash :avoid-shelf-pose-f (send self :get-val 'hard-coded-pose-table)
             #f(0
                79.8926 -14.2822 -125.793 148.271 -46.3623 -4.24072 100.063
                -79.8926 -14.2822 125.793 148.271 46.3623 -4.24072 -100.063))
    (sethash :avoid-shelf-pose-g (send self :get-val 'hard-coded-pose-table)
             #f(0
                93.5156 10.5908 -83.3203 136.318 11.1621 44.6045 95.4272
                -93.5156 10.5908 83.3203 136.318 -11.1621 44.6045 -95.4272))
    (sethash :avoid-shelf-pose-h (send self :get-val 'hard-coded-pose-table)
             #f(0
                13.7988 32.8711 -78.772 147.48 2.87842 -45.0 122.937
                -13.7988 32.8711 78.772 147.48 -2.87842 -45.0 -122.937))
    (sethash :avoid-shelf-pose-i (send self :get-val 'hard-coded-pose-table)
             #f(0
                93.5156 10.5908 -83.3203 136.318 11.1621 44.6045 95.4272
                -93.5156 10.5908 83.3203 136.318 -11.1621 44.6045 -95.4272))
    (sethash :avoid-shelf-pose-j (send self :get-val 'hard-coded-pose-table)
             #f(0
                89.4946 6.02051 -56.0083 139.351 34.1895 22.6538 98.2397
                -89.4946 6.02051 56.0083 139.351 -34.1895 22.6538 -98.2397))
    (sethash :avoid-shelf-pose-k
             (send self :get-val 'hard-coded-pose-table)
             #f(0
                48.2959 18.6108 -51.7896 135.044 48.186 6.87744 89.3408
                -48.2959 18.6108 51.7896 135.044 -48.186 6.87744 -89.3408))
    (sethash :avoid-shelf-pose-l (send self :get-val 'hard-coded-pose-table)
             #f(0
                89.4946 6.02051 -56.0083 139.351 34.1895 22.6538 98.2397
                -89.4946 6.02051 56.0083 139.351 -34.1895 22.6538 -98.2397))
    )
  (:fold-pose-upper (&optional (arm :arms)) (send self :hard-coded-pose :fold-pose-upper arm))
  (:fold-pose-middle (&optional (arm :arms)) (send self :hard-coded-pose :fold-pose-middle arm))
  (:fold-pose-lower (&optional (arm :arms)) (send self :hard-coded-pose :fold-pose-lower arm))
  (:fold-pose-back (&optional (arm :arms)) (send self :hard-coded-pose :fold-pose-back arm))
  (:fold-to-keep-object (&optional (arm :arms)) (send self :hard-coded-pose :fold-to-keep-object arm))
  (:place-object-pose (&optional (arm :arms)) (send self :hard-coded-pose :place-object-pose arm))
  (:rotate-wrist
    (arm angle)
    (let (wrist-index av-tmp)
      (setq wrist-index (if (eq arm :larm) 7 14))
      (setq av-tmp (send *baxter* :angle-vector))
      (setf (elt av-tmp wrist-index) (+ (elt av-tmp wrist-index) angle))
      (send *baxter* :angle-vector av-tmp)))
  (:avoid-shelf-pose
    (arm bin)
    (case bin
      (:a (send self :hard-coded-pose :avoid-shelf-pose-a arm))
      (:b (send self :hard-coded-pose :avoid-shelf-pose-b arm))
      (:c (send self :hard-coded-pose :avoid-shelf-pose-c arm))
      (:d (send self :hard-coded-pose :avoid-shelf-pose-d arm))
      (:e (send self :hard-coded-pose :avoid-shelf-pose-e arm))
      (:f (send self :hard-coded-pose :avoid-shelf-pose-f arm))
      (:g (send self :hard-coded-pose :avoid-shelf-pose-g arm))
      (:h (send self :hard-coded-pose :avoid-shelf-pose-h arm))
      (:i (send self :hard-coded-pose :avoid-shelf-pose-i arm))
      (:j (send self :hard-coded-pose :avoid-shelf-pose-j arm))
      (:k (send self :hard-coded-pose :avoid-shelf-pose-k arm))
      (:l (send self :hard-coded-pose :avoid-shelf-pose-l arm))))
  )
