classdef TestGaussianBlur
    %TestGaussianBlur
    properties (Constant)
        img = uint8([...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 1 1 1 0 0 0 0;...
            0 0 0 1 1 1 0 0 0 0;...
            0 0 0 1 1 1 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
        ]);
    end

    methods (Static)
        function test_1
            result = cv.GaussianBlur(TestGaussianBlur.img);
            validateattributes(result, {class(TestGaussianBlur.img)}, ...
                {'size',size(TestGaussianBlur.img)});
        end

        function test_2
            result = cv.GaussianBlur(TestGaussianBlur.img, 'KSize', [5,7]);
            validateattributes(result, {class(TestGaussianBlur.img)}, ...
                {'size',size(TestGaussianBlur.img)});
        end

        function test_3
            result = cv.GaussianBlur(TestGaussianBlur.img, 'KSize',[5 7], ...
                'SigmaX',1.1, 'SigmaY',1.3, 'BorderType','Default');
            validateattributes(result, {class(TestGaussianBlur.img)}, ...
                {'size',size(TestGaussianBlur.img)});
        end

        function test_error_1
            try
                cv.GaussianBlur();
                throw('UnitTest:Fail');
            catch e
                assert(strcmp(e.identifier,'mexopencv:error'));
            end
        end
    end

end
