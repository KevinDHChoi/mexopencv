classdef TestCalcOpticalFlowDF
    %TestCalcOpticalFlowDF
    properties (Constant)
        im = 255*uint8([...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 1 1 1 0 0 0 0;...
            0 0 0 1 0 1 0 0 0 0;...
            0 0 0 1 1 1 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
        ]);
    end

    methods (Static)
        function test_1
            im1 = TestCalcOpticalFlowDF.im;
            im2 = circshift(im1, [0 1]);
            flow = cv.calcOpticalFlowDF(im1, im2);
        end

        function test_2
            prevImg = cv.imread(fullfile(mexopencv.root(),'test','RubberWhale1.png'), 'Grayscale',true);
            nextImg = cv.imread(fullfile(mexopencv.root(),'test','RubberWhale2.png'), 'Grayscale',true);
            flow = cv.calcOpticalFlowDF(prevImg, nextImg);
            validateattributes(flow, {'single'}, ...
                {'3d', 'size',[size(prevImg,1) size(prevImg,2) 2]});
        end

        function test_error_1
            try
                cv.calcOpticalFlowDF();
                throw('UnitTest:Fail');
            catch e
                assert(strcmp(e.identifier,'mexopencv:error'));
            end
        end
    end

end
