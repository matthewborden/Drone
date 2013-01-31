#include "perf_precomp.hpp"

using namespace std;
using namespace testing;

namespace {

//////////////////////////////////////////////////////////////////////
// StereoBM

typedef std::tr1::tuple<string, string> pair_string;
DEF_PARAM_TEST_1(ImagePair, pair_string);

PERF_TEST_P(ImagePair, Calib3D_StereoBM, Values(pair_string("gpu/perf/aloe.png", "gpu/perf/aloeR.png")))
{
    declare.time(5.0);

    const cv::Mat imgLeft = readImage(GET_PARAM(0), cv::IMREAD_GRAYSCALE);
    ASSERT_FALSE(imgLeft.empty());

    const cv::Mat imgRight = readImage(GET_PARAM(1), cv::IMREAD_GRAYSCALE);
    ASSERT_FALSE(imgRight.empty());

    const int preset = 0;
    const int ndisp = 256;

    if (PERF_RUN_GPU())
    {
        cv::gpu::StereoBM_GPU d_bm(preset, ndisp);

        cv::gpu::GpuMat d_imgLeft(imgLeft);
        cv::gpu::GpuMat d_imgRight(imgRight);
        cv::gpu::GpuMat d_dst;

        d_bm(d_imgLeft, d_imgRight, d_dst);

        TEST_CYCLE()
        {
            d_bm(d_imgLeft, d_imgRight, d_dst);
        }

        GPU_SANITY_CHECK(d_dst);
    }
    else
    {
        cv::StereoBM bm(preset, ndisp);

        cv::Mat dst;

        bm(imgLeft, imgRight, dst);

        TEST_CYCLE()
        {
            bm(imgLeft, imgRight, dst);
        }

        CPU_SANITY_CHECK(dst);
    }
}

//////////////////////////////////////////////////////////////////////
// StereoBeliefPropagation

PERF_TEST_P(ImagePair, Calib3D_StereoBeliefPropagation, Values(pair_string("gpu/stereobp/aloe-L.png", "gpu/stereobp/aloe-R.png")))
{
    declare.time(10.0);

    const cv::Mat imgLeft = readImage(GET_PARAM(0));
    ASSERT_FALSE(imgLeft.empty());

    const cv::Mat imgRight = readImage(GET_PARAM(1));
    ASSERT_FALSE(imgRight.empty());

    const int ndisp = 64;

    if (PERF_RUN_GPU())
    {
        cv::gpu::StereoBeliefPropagation d_bp(ndisp);

        cv::gpu::GpuMat d_imgLeft(imgLeft);
        cv::gpu::GpuMat d_imgRight(imgRight);
        cv::gpu::GpuMat d_dst;

        d_bp(d_imgLeft, d_imgRight, d_dst);

        TEST_CYCLE()
        {
            d_bp(d_imgLeft, d_imgRight, d_dst);
        }

        GPU_SANITY_CHECK(d_dst);
    }
    else
    {
        FAIL() << "No such CPU implementation analogy.";
    }
}

//////////////////////////////////////////////////////////////////////
// StereoConstantSpaceBP

PERF_TEST_P(ImagePair, Calib3D_StereoConstantSpaceBP, Values(pair_string("gpu/stereobm/aloe-L.png", "gpu/stereobm/aloe-R.png")))
{
    declare.time(10.0);

    const cv::Mat imgLeft = readImage(GET_PARAM(0), cv::IMREAD_GRAYSCALE);
    ASSERT_FALSE(imgLeft.empty());

    const cv::Mat imgRight = readImage(GET_PARAM(1), cv::IMREAD_GRAYSCALE);
    ASSERT_FALSE(imgRight.empty());

    const int ndisp = 128;

    if (PERF_RUN_GPU())
    {
        cv::gpu::StereoConstantSpaceBP d_csbp(ndisp);

        cv::gpu::GpuMat d_imgLeft(imgLeft);
        cv::gpu::GpuMat d_imgRight(imgRight);
        cv::gpu::GpuMat d_dst;

        d_csbp(d_imgLeft, d_imgRight, d_dst);

        TEST_CYCLE()
        {
            d_csbp(d_imgLeft, d_imgRight, d_dst);
        }

        GPU_SANITY_CHECK(d_dst);
    }
    else
    {
        FAIL() << "No such CPU implementation analogy.";
    }
}

//////////////////////////////////////////////////////////////////////
// DisparityBilateralFilter

PERF_TEST_P(ImagePair, Calib3D_DisparityBilateralFilter, Values(pair_string("gpu/stereobm/aloe-L.png", "gpu/stereobm/aloe-disp.png")))
{
    const cv::Mat img = readImage(GET_PARAM(0), cv::IMREAD_GRAYSCALE);
    ASSERT_FALSE(img.empty());

    const cv::Mat disp = readImage(GET_PARAM(1), cv::IMREAD_GRAYSCALE);
    ASSERT_FALSE(disp.empty());

    const int ndisp = 128;

    if (PERF_RUN_GPU())
    {
        cv::gpu::DisparityBilateralFilter d_filter(ndisp);

        cv::gpu::GpuMat d_img(img);
        cv::gpu::GpuMat d_disp(disp);
        cv::gpu::GpuMat d_dst;

        d_filter(d_disp, d_img, d_dst);

        TEST_CYCLE()
        {
            d_filter(d_disp, d_img, d_dst);
        }

        GPU_SANITY_CHECK(d_dst);
    }
    else
    {
        FAIL() << "No such CPU implementation analogy.";
    }
}

//////////////////////////////////////////////////////////////////////
// TransformPoints

DEF_PARAM_TEST_1(Count, int);

PERF_TEST_P(Count, Calib3D_TransformPoints, Values(5000, 10000, 20000))
{
    const int count = GetParam();

    cv::Mat src(1, count, CV_32FC3);
    fillRandom(src, -100, 100);

    const cv::Mat rvec = cv::Mat::ones(1, 3, CV_32FC1);
    const cv::Mat tvec = cv::Mat::ones(1, 3, CV_32FC1);

    if (PERF_RUN_GPU())
    {
        cv::gpu::GpuMat d_src(src);
        cv::gpu::GpuMat d_dst;

        cv::gpu::transformPoints(d_src, rvec, tvec, d_dst);

        TEST_CYCLE()
        {
            cv::gpu::transformPoints(d_src, rvec, tvec, d_dst);
        }

        GPU_SANITY_CHECK(d_dst);
    }
    else
    {
        FAIL() << "No such CPU implementation analogy.";
    }
}

//////////////////////////////////////////////////////////////////////
// ProjectPoints

PERF_TEST_P(Count, Calib3D_ProjectPoints, Values(5000, 10000, 20000))
{
    const int count = GetParam();

    cv::Mat src(1, count, CV_32FC3);
    fillRandom(src, -100, 100);

    const cv::Mat rvec = cv::Mat::ones(1, 3, CV_32FC1);
    const cv::Mat tvec = cv::Mat::ones(1, 3, CV_32FC1);
    const cv::Mat camera_mat = cv::Mat::ones(3, 3, CV_32FC1);

    if (PERF_RUN_GPU())
    {
        cv::gpu::GpuMat d_src(src);
        cv::gpu::GpuMat d_dst;

        cv::gpu::projectPoints(d_src, rvec, tvec, camera_mat, cv::Mat(), d_dst);

        TEST_CYCLE()
        {
            cv::gpu::projectPoints(d_src, rvec, tvec, camera_mat, cv::Mat(), d_dst);
        }

        GPU_SANITY_CHECK(d_dst);
    }
    else
    {
        cv::Mat dst;

        cv::projectPoints(src, rvec, tvec, camera_mat, cv::noArray(), dst);

        TEST_CYCLE()
        {
            cv::projectPoints(src, rvec, tvec, camera_mat, cv::noArray(), dst);
        }

        CPU_SANITY_CHECK(dst);
    }
}

//////////////////////////////////////////////////////////////////////
// SolvePnPRansac

PERF_TEST_P(Count, Calib3D_SolvePnPRansac, Values(5000, 10000, 20000))
{
    declare.time(10.0);

    const int count = GetParam();

    cv::Mat object(1, count, CV_32FC3);
    fillRandom(object, -100, 100);

    cv::Mat camera_mat(3, 3, CV_32FC1);
    fillRandom(camera_mat, 0.5, 1);
    camera_mat.at<float>(0, 1) = 0.f;
    camera_mat.at<float>(1, 0) = 0.f;
    camera_mat.at<float>(2, 0) = 0.f;
    camera_mat.at<float>(2, 1) = 0.f;

    const cv::Mat dist_coef(1, 8, CV_32F, cv::Scalar::all(0));

    std::vector<cv::Point2f> image_vec;
    cv::Mat rvec_gold(1, 3, CV_32FC1);
    fillRandom(rvec_gold, 0, 1);
    cv::Mat tvec_gold(1, 3, CV_32FC1);
    fillRandom(tvec_gold, 0, 1);
    cv::projectPoints(object, rvec_gold, tvec_gold, camera_mat, dist_coef, image_vec);

    cv::Mat image(1, count, CV_32FC2, &image_vec[0]);

    cv::Mat rvec;
    cv::Mat tvec;

    if (PERF_RUN_GPU())
    {
        cv::gpu::solvePnPRansac(object, image, camera_mat, dist_coef, rvec, tvec);

        TEST_CYCLE()
        {
            cv::gpu::solvePnPRansac(object, image, camera_mat, dist_coef, rvec, tvec);
        }
    }
    else
    {
        cv::solvePnPRansac(object, image, camera_mat, dist_coef, rvec, tvec);

        TEST_CYCLE()
        {
            cv::solvePnPRansac(object, image, camera_mat, dist_coef, rvec, tvec);
        }
    }

    CPU_SANITY_CHECK(rvec);
    CPU_SANITY_CHECK(tvec);
}

//////////////////////////////////////////////////////////////////////
// ReprojectImageTo3D

PERF_TEST_P(Sz_Depth, Calib3D_ReprojectImageTo3D, Combine(GPU_TYPICAL_MAT_SIZES, Values(CV_8U, CV_16S)))
{
    const cv::Size size = GET_PARAM(0);
    const int depth = GET_PARAM(1);

    cv::Mat src(size, depth);
    fillRandom(src, 5.0, 30.0);

    cv::Mat Q(4, 4, CV_32FC1);
    fillRandom(Q, 0.1, 1.0);

    if (PERF_RUN_GPU())
    {
        cv::gpu::GpuMat d_src(src);
        cv::gpu::GpuMat d_dst;

        cv::gpu::reprojectImageTo3D(d_src, d_dst, Q);

        TEST_CYCLE()
        {
            cv::gpu::reprojectImageTo3D(d_src, d_dst, Q);
        }

        GPU_SANITY_CHECK(d_dst);
    }
    else
    {
        cv::Mat dst;

        cv::reprojectImageTo3D(src, dst, Q);

        TEST_CYCLE()
        {
            cv::reprojectImageTo3D(src, dst, Q);
        }

        CPU_SANITY_CHECK(dst);
    }
}

//////////////////////////////////////////////////////////////////////
// DrawColorDisp

PERF_TEST_P(Sz_Depth, Calib3D_DrawColorDisp, Combine(GPU_TYPICAL_MAT_SIZES, Values(CV_8U, CV_16S)))
{
    const cv::Size size = GET_PARAM(0);
    const int type = GET_PARAM(1);

    cv::Mat src(size, type);
    fillRandom(src, 0, 255);

    if (PERF_RUN_GPU())
    {
        cv::gpu::GpuMat d_src(src);
        cv::gpu::GpuMat d_dst;

        cv::gpu::drawColorDisp(d_src, d_dst, 255);

        TEST_CYCLE()
        {
            cv::gpu::drawColorDisp(d_src, d_dst, 255);
        }

        GPU_SANITY_CHECK(d_dst);
    }
    else
    {
        FAIL() << "No such CPU implementation analogy.";
    }
}

} // namespace
